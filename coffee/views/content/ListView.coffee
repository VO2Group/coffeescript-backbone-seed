class ListView extends Backbone.View

	el: '#content'

	events:
		'click #add': 'add'
		'click .edit': 'edit'
		'click .delete': 'delete'

	template: Templates['list']

	initialize: ->
		@collection.on 'reset add remove', @render
		@collection.fetch reset: true

	render: =>
		@$el.html @template.render items: @collection.toJSON()
		@

	add: (event) ->
		item = new Item
		item.save null, success: => @collection.add item.toJSON()

		# Don't follow the link
		false

	edit: (event) ->
		id = @$(event.target).parent().data('item')
		window.location.replace "/#items/#{id}"

	delete: (event) ->
		id = @$(event.target).parent().data('item')
		item = @collection.get id
		item.destroy()
