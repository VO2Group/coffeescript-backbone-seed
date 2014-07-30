class LoginView extends Backbone.View

	el: 'body'

	events:
		'click #ok': 'ok'

	template: """
		<h1>Login</h1>
		<p>
			login: <input id="login" type="text"/>
			<br>
			pass: <input id="pass" type="password"/>
		</p>
		<button id="ok" type="button" class="btn btn-default btn-xs">Ok</button>
		"""

	initialize: ->

	render: =>
		@$el.html Mustache.render @template
		@

	ok: (event) ->
		$.post '/login', {login: @$('#login').val(), pass: @$('#pass').val()}, (data) -> window.location.replace '/#'
