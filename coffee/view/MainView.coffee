class MainView extends Backbone.View

	el: 'body'

	events:
		'click #logout': 'logout'

	template: """
		{{#logged}}
			<button id="logout" class="btn btn-default btn-xs">Logout</button>
		{{/logged}}
		<div id="content">
		</div>
	"""

	initialize: ->
		@model.on 'change', @render

	render: =>
		@$el.html Mustache.render @template, @model.toJSON()
		@

	logout: (event) ->
		$.get '/logout', (data) -> window.location.replace '/#login'
