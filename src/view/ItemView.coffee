class ItemView extends Backbone.View

	el: 'body'

	html: """
		<h1>Item</h1>
		<p>
			num: {{num}}
			name: {{name}}
		</p>
		"""

	initialize: ->
		@render()

	render: ->
		@$el.html Mustache.render @html, @model.toJSON()
		@
