class LoginView extends Backbone.View

	el: '#content'

	events:
		'submit #form': 'submit'

	template: Templates['login']

	render: =>
		@$el.html @template.render @model.toJSON()
		@

	submit: (event) ->
		credentials =
			login: @$('#login').val()
			pass: @$('#pass').val()

		$.post '/login', credentials, (data) =>
			@model.set _.extend logged: true, _.omit credentials, 'pass'
			window.location.replace '/#'

		# Don't submit the form
		false
