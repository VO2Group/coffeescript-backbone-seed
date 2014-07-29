fs = require 'fs'

{print} = require 'sys'
{spawn} = require 'child_process'

task 'build', 'Build js/main.js from coffee/', ->
	compile

task 'watch', 'Watch coffee/ for changes', ->
	compile true

task 'clean', 'Delete js/main.js', ->
	fs.unlinkSync 'js/main.js'

compile = (watch = false) ->
	options = ['-c', '-o', 'js', '-j', 'main.js', 'coffee']
	options = ['-w'].concat options if watch
	coffee = spawn 'coffee', options
	coffee.stderr.on 'data', (data) ->
		process.stderr.write data.toString()
	coffee.stdout.on 'data', (data) ->
		print data.toString()