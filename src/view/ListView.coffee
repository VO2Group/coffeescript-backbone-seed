class ListView extends Backbone.View

	el: 'body'

	events:
		'click #add': 'add'

	html: """
		<h1>List</h1>
		<button id="add">Add</button>
		<ul>
			{{#list}}
				<li><a href="#/item/{{num}}">{{num}}: {{name}}</a></li>
			{{/list}}
		</ul>
		"""

	initialize: ->
		@collection.on 'change', @render
		@render()

	render: =>
		@$el.html Mustache.render @html, list: @collection.toJSON()
		@

	add: ->
		@collection.add new Item
		@collection.trigger 'change'
