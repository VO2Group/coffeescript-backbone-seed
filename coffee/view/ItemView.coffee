class ItemView extends Backbone.View

	el: 'body'

	events:
		'click #delete': 'delete'

	html: """
		<h1>Item</h1>
		<p>
			id: {{id}}
			name: {{name}}
		</p>
		<button id="delete" href="">Delete</button>
		"""

	initialize: ->
		@model.on 'change', @render
		@model.on 'reset', @render
		@model.fetch reset: true

	render: =>
		@$el.html Mustache.render @html, @model.toJSON()
		@

	delete: ->
		@model.destroy wait: true
		window.location.hash = ""
