class ItemView extends Backbone.View

	el: '#content'

	events:
		'click #save': 'save'

	template: """
		name:
		<input id="name" type="text" value="{{name}}"/>
		<button id="save" type="button" class="btn btn-default btn-xs">Save</button>
	"""

	initialize: ->
		@model.on 'change', @render
		@model.fetch()

	render: =>
		@$el.html Mustache.render @template, @model.toJSON()
		@

	save: (event) ->
		@model.set name: @$('#name').val()
		@model.save()
		window.location.replace '/#'
