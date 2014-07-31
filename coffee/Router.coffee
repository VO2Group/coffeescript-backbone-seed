class Router extends Backbone.Router

	routes:
		'': 'items'
		'item/:id': 'item'
		'login': 'login'

	initialize: ->
		$.ajaxSetup statusCode: 401: -> window.location.replace '/#login'
