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
app.use session {secret: 'This is secret !', resave: true, saveUninitialized: true}
app.use serveStatic path.join __dirname, '..'

check = (req, res, next) ->
	if (!req.session.user)
		res.status(401).json()
	else
		next()

items = [
	{id: 0, name: "foo"}
	{id: 1, name: "bar"}
	{id: 2, name: "baz"}
]

app.post '/login', (req, res, next) ->
	if (req.body.login == 'admin' and req.body.pass == 'admin')
		req.session.user = true
		res.status(200).json logged: true
	else
		res.status(400).json()

app.get '/logout', (req, res, next) ->
	delete req.session.user
	res.status(200).json()

app.get '/items', check, (req, res, next) ->
	res.json items

app.post '/items', check, (req, res, next) ->
	if (items.length is 0)
		items.push {id: 0, name: req.body.name}
	else
		items.push {id: items[..].pop().id + 1, name: req.body.name}
	res.status(200).json()

app.get '/items/:id', check, (req, res, next) ->
	res.json (item for item in items when item.id is parseInt req.params.id)[0]

app.put '/items/:id', check, (req, res, next) ->
	(item for item in items when item.id is parseInt req.params.id)[0].name = req.body.name
	res.status(200).json()

app.delete '/items/:id', check, (req, res, next) ->
	items = (item for item in items when item.id isnt parseInt req.params.id)
	res.status(200).json()

app.listen 8080
