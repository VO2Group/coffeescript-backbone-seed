fs = require 'fs'

{spawn} = require 'child_process'
{print} = require 'sys'

# Beware of the order here! You must respect the dependencies order
files = 
	coffee: [
		'coffee/models/Item.coffee'
		'coffee/models/User.coffee'
		'coffee/collections/List.coffee'
		'coffee/views/content/EditView.coffee'
		'coffee/views/content/ListView.coffee'
		'coffee/views/content/LoginView.coffee'
		'coffee/views/MainView.coffee'
		'coffee/Application.coffee'
	]
	hogan: [
		'templates/content/edit.html'
		'templates/content/list.html'
		'templates/content/login.html'
		'templates/main.html'
	]


task 'compile', 'Invoke all compile: tasks', ->
	invoke 'compile:coffee'
	invoke 'compile:hogan'

task 'clean', 'Invoke all clean: tasks', ->
	invoke 'clean:coffee'
	invoke 'clean:hogan'

task 'watch', 'Invoke all watch: tasks', ->
	invoke 'watch:hogan'
	invoke 'watch:coffee'


###
	Coffeescript
###

task 'compile:coffee', "Compile js/coffee.js from #{files.coffee.join(', ')}", ->
	coffee = spawn 'coffee', ['-c', '-o', 'js', '-j', 'coffee.js'].concat files.coffee
	coffee.stderr.on 'data', (chunk) -> process.stderr.write chunk.toString()
	coffee.stdout.on 'data', (chunk) -> print chunk.toString()

task 'clean:coffee', 'Delete js/coffee.js', ->
	fs.unlinkSync 'js/coffee.js'

task 'watch:coffee', "Watch #{files.coffee.join(', ')} for changes", ->
	coffee = spawn 'coffee', ['-w', '-c', '-o', 'js', '-j', 'coffee.js'].concat files.coffee
	coffee.stderr.on 'data', (chunk) -> process.stderr.write chunk.toString()
	coffee.stdout.on 'data', (chunk) -> print chunk.toString()


###
	Hogan.js
###

task 'compile:hogan', "Compile js/templates.js from #{files.hogan.join(', ')}", ->
	content = ''
	hulk = spawn 'hulk', ['--variable', 'Templates'].concat files.hogan
	hulk.stderr.on 'data', (chunk) -> process.stderr.write chunk.toString()
	hulk.stdout.on 'data', (chunk) -> content += chunk.toString()
	hulk.stdout.on 'end', () -> fs.writeFileSync 'js/templates.js', content, 'utf8'

task 'clean:hogan', 'Delete js/templates.js', ->
	fs.unlinkSync 'js/templates.js'

task 'watch:hogan', "Watch #{files.hogan.join(', ')} for changes", ->
	for file in files.hogan
		fs.watch file, (event, filename) -> invoke 'compile:hogan'
