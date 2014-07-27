class LayoutView extends Backbone.View

	el: '#Layout'

	html = """
		<strong>
			cup of coffeescript
		</strong>
		"""

	initialize: ->
		@render()

	render: ->
		@$el.html @html
  