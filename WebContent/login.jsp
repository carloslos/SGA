<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<title>SGA - Login</title>
</head>
<body style="background-color:#000000;">

<div class="container-fluid">
	<div class="row">
		<div class="col-6">
			<h1><font color="#cccccc">Bienvenido a S.G.A.</font></h1>
			<h6><font color="#cccccc">(Sistema de Gestion Academica)</font></h6>
		</div>
	</div>
</div>

<form id="login" method="post" action="servletLogin">
	<div class="container">
		<div class="row">
			<div class="col-12 pb-5"></div>
			<div class="col-12 pt-5 pb-5 text-center">
				<font color="#cccccc">
					<label style="margin-right: 115px">Legajo:</label> <br> <input type="text" id="txtLegajo" name="txtLegajo" pattern="[a-z0-9]{1,15}" required/> <br/><br/>
					<label style="margin-right: 120px">Clave:</label> <br> <input type="password" id="txtClave" name="txtClave" pattern="[^' ']+" required/> <br/> <br/><br/>
				</font>
				<input type="submit" name="btnIngresar" value="Ingresar" /> <br><br>
					<%
					if (session.getAttribute("login") != null) 
					{
						if ((Boolean)session.getAttribute("login") == true) 
						{
							if ((Boolean)session.getAttribute("admin") == true) 
							{
								response.sendRedirect("menu.jsp"); 
							}
							else
							{
								if(session.getAttribute("user")!=null)
								{
									response.sendRedirect("cursosP.jsp");
								}
								else
								{
									%> <font color="#cccccc">Legajo y/o clave incorrecto.</font><br> <%
								}
							} 
						}
						else
						{
							%> <font color="#cccccc">Legajo y/o clave incorrecto.</font><br> <%
						}
					}
					%>
			</div>
		</div>
	</div>
</form>

</body>
</html>