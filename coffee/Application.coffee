# Thanks to JQuery, the application starts when the DOM is ready!
$ ->

	user = new User
	list = new List
	mainView = new MainView model: user

	router = new Backbone.Router
		routes:
			'': 'items'
			'items/:id': 'item'
			'login': 'login'

	$.ajaxSetup
		statusCode:
			401: =>
				user.set logged: false
				window.location.replace '/#login'

	router.on 'route:items', ->
		mainView.setContent new ListView collection: list
	router.on 'route:item', (id) ->
		mainView.setContent new EditView model: new Item id: id
	router.on 'route:login', ->
		mainView.setContent new LoginView model: user

	# Everything really start here
	Backbone.history.start()
