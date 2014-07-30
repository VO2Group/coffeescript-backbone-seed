class ItemsView extends Backbone.View

	el: 'body'

	events:
		'click #add': 'add'
		'click .edit': 'edit'
		'click .delete': 'delete'

	template: """
		<h1>List</h1>
		<p>
			<button id="add" class="btn btn-default btn-xs">Add</button>
		</p>
		<ul>
			{{#items}}
				<li>
					<p>{{name}}</p>
					<p data-item="{{id}}">
						<button type="button" class="btn btn-default btn-xs edit">Edit</button>
						<button type="button" class="btn btn-default btn-xs delete">Delete</button>
					</p>
				</li>
			{{/items}}
		</ul>
		"""

	initialize: ->
		@collection.on 'reset', @render
		@collection.fetch reset: true

	render: =>
		@$el.html Mustache.render @template, items: @collection.toJSON()
		@

	add: (event) ->
		console.log event
		@collection.create new Item, wait: true
		@collection.fetch reset: true

	edit: (event) ->
		id = @$(event.target).parent().data('item')
		window.location.replace "/#item/#{id}"

	delete: (event) ->
		item = new Item id: @$(event.target).parent().data('item')
		item.destroy wait: true
		@collection.fetch reset: true
