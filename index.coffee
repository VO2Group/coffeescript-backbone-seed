path = require 'path'
express = require 'express'

app = express()

app.use express.json()
app.use express.urlencoded()
app.use express.static path.join __dirname, 'app'

data = [
	{
		id: 0
		name: "zero"
	}
	{
		id: 1
		name: "one"
	}	
]

app.get '/items', (req, res, next) ->
	res.json data

app.listen 8080
