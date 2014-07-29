class Router extends Backbone.Router

	routes:
		"": "items"
		"item/:id": "item"

	items: ->
		view = new ItemsView collection: new Items
		view.render()

	item: (id) ->
		view = new ItemView model: new Item id: id
		view.render()
