class ListView2 extends Backbone.View

	el: 'body .container'

	initialize: ->
		@render()

	render: ->
		@$el.html '<h1>List2</h1>'
