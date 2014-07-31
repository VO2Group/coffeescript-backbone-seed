class LoginView extends Backbone.View

	el: '#content'

	events:
		'click #ok': 'ok'

	html: """
		login: <input id="login" type="text"/>
		pass: <input id="pass" type="password"/>
		<button id="ok" type="button" class="btn btn-default btn-xs">Ok</button>
	"""

	render: =>
		@$el.html @html
		@

	ok: (event) ->
		credentials = login: @$('#login').val(), pass: @$('#pass').val()
		$.post '/login', credentials, (data) -> window.location.replace '/#'
