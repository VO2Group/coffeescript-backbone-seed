class EditView extends Backbone.View

	el: '#content'

	events:
		'submit #form': 'submit'

	template: Templates['edit']

	initialize: ->
		@model.on 'change', @render
		@model.fetch()

	render: =>
		@$el.html @template.render @model.toJSON()
		@

	submit: (event) ->
		@model.set name: @$('#name').val()
		@model.save()

		window.location.replace '/#'
		
		# Don't submit the form
		false
