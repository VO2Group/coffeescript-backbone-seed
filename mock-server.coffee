path = require 'path'

express = require 'express'
morgan  = require 'morgan'
bodyParser = require 'body-parser'
session = require 'express-session'
serveStatic = require 'serve-static'

app = express()

app.use morgan 'combined'
app.use bodyParser.json()
app.use bodyParser.urlencoded extended: true
app.use session secret: 'this is secret', resave: true, saveUninitialized: true
app.use serveStatic path.join __dirname, '.'

items = [
	{id: 0, name: 'foo'}
	{id: 1, name: 'bar'}
	{id: 2, name: 'baz'}
]

check = (req, res, next) ->
	if not req.session.user then res.status(401).end() else next()

convert = (req, res, next) ->
	req.params.id = parseInt req.params.id
	next()

app.post '/login', (req, res, next) ->
	if req.body.login is 'admin' and req.body.pass is 'admin'
		req.session.user = true
		res.end()
	else
		res.status(400).end()

app.get '/logout', (req, res, next) ->
	delete req.session.user
	res.end()

app.get '/items', check, (req, res, next) ->
	res.json items

app.post '/items', check, (req, res, next) ->
	if items.length is 0
		items.push id: 0, name: req.body.name
	else
		items.push id: items[..].pop().id + 1, name: req.body.name
	res.end()

app.get '/items/:id', check, convert, (req, res, next) ->
	res.json (item for item in items when item.id is req.params.id)[0]

app.put '/items/:id', check, convert, (req, res, next) ->
	(item for item in items when item.id is req.params.id)[0].name = req.body.name
	res.end()

app.delete '/items/:id', check, convert, (req, res, next) ->
	items = (item for item in items when item.id isnt req.params.id)
	res.end()

app.listen 8080
