class ListView extends Backbone.View

	el: 'body .container'

	initialize: ->
		@render()

	render: ->
		@$el.html '<h1>List</h1>'
  