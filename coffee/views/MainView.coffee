class MainView extends Backbone.View

	el: 'body'

	content: null

	events:
		'click #logout': 'logout'

	template: Templates['main']

	initialize: ->
		@model.on 'change', @render
		@render()

	render: =>
		@$el.html @template.render @model.toJSON()
		@content.delegateEvents() if @content
		@

	setContent: (content) ->
		@content.undelegateEvents() if @content
		@content = content
		@content.render()

	logout: (event) ->
		$.get '/logout', (data) =>
			@model.set logged: false
			window.location.replace '/#login'

		# Don't follow the link
		false
