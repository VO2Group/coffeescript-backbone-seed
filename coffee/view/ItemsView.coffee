class ItemsView extends Backbone.View

	el: '#content'

	collection: new Items

	events:
		'click #add': 'add'
		'click .edit': 'edit'
		'click .delete': 'delete'

	template: """
		<button id="add" class="btn btn-default btn-xs">Add</button>
		<ul>
			{{#items}}
				<li>
					<div data-item="{{id}}">
						{{name}}
						<button type="button" class="btn btn-default btn-xs edit">Edit</button>
						<button type="button" class="btn btn-default btn-xs delete">Delete</button>
					</div>
				</li>
			{{/items}}
		</ul>
	"""

	initialize: ->
		@collection.on 'reset add remove', @render
		@collection.fetch reset: true

	render: =>
		@$el.html Mustache.render @template, items: @collection.toJSON()
		@

	add: (event) ->
		@collection.add @collection.create new Item, wait: true

	edit: (event) ->
		id = @$(event.target).parent().data('item')
		window.location.replace "/#item/#{id}"

	delete: (event) ->
		item = new Item @collection.remove @collection.at @$(event.target).parent().data('item')
		item.destroy()
