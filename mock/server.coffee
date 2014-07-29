path = require 'path'

express = require 'express'
morgan  = require 'morgan'
bodyParser = require 'body-parser'
serveStatic = require 'serve-static'

app = express()

app.use morgan 'combined'
app.use bodyParser.json()
app.use bodyParser.urlencoded extended: true
app.use serveStatic path.join __dirname, '.'

items = [
	{
		id: 0
		name: "foo"
	}
	{
		id: 1
		name: "bar"
	}
]

app.get '/items', (req, res, next) ->
	res.json items

app.put '/items/:id', (req, res, next) ->
	items.push {id: parseInt(req.params.id), name: req.body.name}
	res.status(200).json()

app.get '/items/:id', (req, res, next) ->
	res.json (item for item in items when item.id is parseInt req.params.id)[0]

app.listen 8080
