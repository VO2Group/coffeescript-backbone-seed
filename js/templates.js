if (!!!Templates) var Templates = {};
Templates["edit"] = new Hogan.Template({code: function (c,p,i) { var t=this;t.b(i=i||"");t.b("<div class=\"row clearfix\">");t.b("\n" + i);t.b("	<div class=\"col-md-6 column\">");t.b("\n" + i);t.b("		<form id=\"form\" role=\"form\">");t.b("\n" + i);t.b("			<div class=\"form-group\">");t.b("\n" + i);t.b("				 <label for=\"name\">name</label>");t.b("\n" + i);t.b("				 <input type=\"text\" class=\"form-control\" id=\"name\" value=\"");t.b(t.v(t.f("name",c,p,0)));t.b("\" />");t.b("\n" + i);t.b("			</div>");t.b("\n" + i);t.b("			<button type=\"submit\" class=\"btn btn-default\">Ok</button>");t.b("\n" + i);t.b("		</form>");t.b("\n" + i);t.b("	</div>");t.b("\n" + i);t.b("</div>");return t.fl(); },partials: {}, subs: {  }});
Templates["list"] = new Hogan.Template({code: function (c,p,i) { var t=this;t.b(i=i||"");t.b("<div class=\"row clearfix\">");t.b("\n" + i);t.b("	<div class=\"col-md-6 column\">");t.b("\n" + i);t.b("		<a id=\"add\" href=\"\">Add a new item</a>");t.b("\n" + i);t.b("		<table class=\"table\">");t.b("\n" + i);if(t.s(t.f("items",c,p,1),c,p,0,136,395,"{{ }}")){t.rs(c,p,function(c,p,t){t.b("				<tr>");t.b("\n" + i);t.b("					<td>");t.b("\n" + i);t.b("						");t.b(t.v(t.f("name",c,p,0)));t.b("\n" + i);t.b("					</td>");t.b("\n" + i);t.b("					<td data-item=\"");t.b(t.v(t.f("id",c,p,0)));t.b("\">");t.b("\n" + i);t.b("						<button type=\"button\" class=\"btn btn-default btn-xs edit\">Edit</button>");t.b("\n" + i);t.b("						<button type=\"button\" class=\"btn btn-default btn-xs delete\">Delete</button>");t.b("\n" + i);t.b("					</td>");t.b("\n" + i);t.b("				</tr>");t.b("\n" + i);});c.pop();}t.b("		</table>");t.b("\n" + i);t.b("	</div>");t.b("\n" + i);t.b("</div>");return t.fl(); },partials: {}, subs: {  }});
Templates["login"] = new Hogan.Template({code: function (c,p,i) { var t=this;t.b(i=i||"");t.b("<div class=\"row clearfix\">");t.b("\n" + i);t.b("	<div class=\"col-md-6 column\">");t.b("\n" + i);t.b("		<form id=\"form\" role=\"form\">");t.b("\n" + i);t.b("			<div class=\"form-group\">");t.b("\n" + i);t.b("				 <label for=\"login\">Login</label>");t.b("\n" + i);t.b("				 <input type=\"text\" class=\"form-control\" id=\"login\" />");t.b("\n" + i);t.b("			</div>");t.b("\n" + i);t.b("			<div class=\"form-group\">");t.b("\n" + i);t.b("				 <label for=\"pass\">Password</label>");t.b("\n" + i);t.b("				 <input type=\"password\" class=\"form-control\" id=\"pass\" />");t.b("\n" + i);t.b("			</div>");t.b("\n" + i);t.b("			<button type=\"submit\" class=\"btn btn-default\">Ok</button>");t.b("\n" + i);t.b("		</form>");t.b("\n" + i);t.b("	</div>");t.b("\n" + i);t.b("</div>");return t.fl(); },partials: {}, subs: {  }});
Templates["main"] = new Hogan.Template({code: function (c,p,i) { var t=this;t.b(i=i||"");t.b("<div class=\"container\">");t.b("\n" + i);t.b("	<div class=\"row clearfix\">");t.b("\n" + i);t.b("		<div class=\"col-md-6\">");t.b("\n" + i);t.b("			<h3 class=\"text-right\">");t.b("\n" + i);t.b("				coffeescript-backbone-seed");t.b("\n" + i);t.b("			</h3>");t.b("\n" + i);if(t.s(t.f("logged",c,p,1),c,p,0,158,252,"{{ }}")){t.rs(c,p,function(c,p,t){t.b("			<p class=\"text-right\">");t.b("\n" + i);t.b("				Hi, ");t.b(t.v(t.f("login",c,p,0)));t.b(" ! (<a id=\"logout\" href=\"\">Logout</a>)");t.b("\n" + i);t.b("			</p>");t.b("\n" + i);});c.pop();}t.b("		</div>");t.b("\n" + i);t.b("	</div>");t.b("\n" + i);t.b("	<div class=\"row clearfix\">");t.b("\n" + i);t.b("		<div id=\"content\" class=\"col-md-12\">");t.b("\n" + i);t.b("		</div>");t.b("\n" + i);t.b("	</div>");t.b("\n" + i);t.b("</div>");return t.fl(); },partials: {}, subs: {  }});