fs = require 'fs'

{print} = require 'sys'
{spawn} = require 'child_process'

task 'build', 'Build app/js/main.js from src/', ->
	coffee = spawn 'coffee', ['-c', '-o', 'app/js', '-j', 'main.js', 'src']
	coffee.stderr.on 'data', (data) ->
		process.stderr.write data.toString()
	coffee.stdout.on 'data', (data) ->
		print data.toString()

task 'watch', 'Watch src/ for changes', ->
	coffee = spawn 'coffee', ['-w', '-c', '-o', 'app/js', '-j', 'main.js', 'src']
	coffee.stderr.on 'data', (data) ->
		process.stderr.write data.toString()
	coffee.stdout.on 'data', (data) ->
		print data.toString()

task 'mock', 'Start mock server', ->
	server = spawn 'coffee', ['index.coffee']
	server.stderr.on 'data', (data) ->
		process.stderr.write data.toString()
	server.stdout.on 'data', (data) ->
		print data.toString()
