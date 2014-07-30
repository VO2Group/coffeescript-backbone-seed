class ItemView extends Backbone.View

	el: 'body'

	events:
		'click #save': 'save'

	template: """
		<h1>Item</h1>
		<p>
			name: <input id="field" type="text" value="{{name}}"/> <button id="save" type="button" class="btn btn-default btn-xs">Save</button>
		</p>
		<a href="">Back</a>
		"""

	initialize: ->
		@model.on 'reset change', @render
		@model.fetch reset: true

	render: =>
		@$el.html Mustache.render @template, @model.toJSON()
		@

	save: (event) ->
		@model.set name: @$('#field').val()
		@model.save()
