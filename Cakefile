{unlinkSync} = require 'fs'
{spawn} = require 'child_process'
{print} = require 'sys'

options = ['-c', '-o', 'js', '-j', 'main.js', 'coffee']

task 'build', 'Build js/main.js from coffee/', ->
	compile options

task 'watch', 'Watch coffee/ for changes', ->
	compile ['-w'].concat options

task 'clean', 'Delete js/main.js', ->
	unlinkSync 'js/main.js'

compile = (options) ->
	coffee = spawn 'coffee', options
	coffee.stderr.on 'data', (data) -> process.stderr.write data.toString()
	coffee.stdout.on 'data', (data) -> print data.toString()
