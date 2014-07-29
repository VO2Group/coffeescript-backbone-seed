class ItemView extends Backbone.View

	el: 'body'

	html: """
		<h1>Item</h1>
		<p>
			id: {{id}}
			name: {{name}}
		</p>
		"""

	initialize: ->
		@model.on 'change', @render
		@model.on 'reset', @render
		@model.fetch reset: true

	render: =>
		@$el.html Mustache.render @html, @model.toJSON()
		@
