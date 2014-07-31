$ ->

	userModel = new User

	mainView = new MainView model: userModel
	mainView.render()

	view = null
	router = new Router

	router.on 'route:items', ->
		userModel.set logged: true
		view.undelegateEvents() if view
		view = new ItemsView
		view.render()

	router.on 'route:item', (id) ->
		userModel.set logged: true
		view.undelegateEvents() if view
		view = new ItemView model: new Item id: id
		view.render()

	router.on 'route:login', ->
		userModel.set logged: false
		view.undelegateEvents() if view
		view = new LoginView
		view.render()

	Backbone.history.start()
