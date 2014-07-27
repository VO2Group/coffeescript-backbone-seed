class Router extends Backbone.Router
	routes:
		"": "index"
		"list": "list"
		"list2/:id": "list2"

	index: =>
		view = new ListView
		view.render()

	list: =>
		view = new ListView
		view.render()

	list2: (id)=>
		view = new ListView2
		view.render()
