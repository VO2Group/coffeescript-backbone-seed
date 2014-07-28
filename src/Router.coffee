class Router extends Backbone.Router

	routes:
		"": "list"
		"item/:num": "item"

	list: ->
		view = new ListView collection: new List
		view.render()

	item: (num) ->
		view = new ItemView model: new Item num: num
		view.render()
