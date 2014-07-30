class Router extends Backbone.Router

	routes:
		"": "items"
		"item/:id": "item"
		"login": "login"

	view: null

	initialize: ->
		$.ajaxSetup {statusCode: {401: -> window.location.replace '/#login'}}

	items: ->
		@view.undelegateEvents() if @view
		@view = new ItemsView collection: new Items
		@view.render()

	item: (id) ->
		@view.undelegateEvents() if @view
		@view = new ItemView model: new Item id: id
		@view.render()

	login: ->
		@view.undelegateEvents() if @view
		@view = new LoginView
		@view.render()
