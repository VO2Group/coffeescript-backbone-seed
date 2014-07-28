class ItemsView extends Backbone.View

	el: 'body'

	events:
		'click #add': 'add'

	html: """
		<h1>List</h1>
		<button id="add">Add</button>
		<ul>
			{{#list}}
				<li><a href="#/item/{{id}}">{{id}}: {{name}}</a></li>
			{{/list}}
		</ul>
		"""

	initialize: ->
		@collection.on 'change', @render
		@collection.on 'reset', @render
		@collection.fetch reset: true

	render: =>
		@$el.html Mustache.render @html, list: @collection.toJSON()
		@

	add: ->
		@collection.push new Item id: @collection.length + 1
		@collection.trigger 'change'
