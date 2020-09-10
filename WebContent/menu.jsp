<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

<%
if (session.getAttribute("login") == null)
{
	response.sendRedirect("login.jsp");	
}
else
{
	if((Boolean)session.getAttribute("login") == false || (Boolean)session.getAttribute("admin") == false)
	{
		response.sendRedirect("login.jsp");	
	}
}
%>

<title>SGA - Menu</title>
</head>
<body style="background-color:#000000;">

<form method="post" action="servletLogin">
<div class="container-fluid">
	<div class="row">
		<div class="col-6">
			<h1><font color="#cccccc">S.G.A.</font></h1>
			<h6><font color="#cccccc">(Sistema de Gestion Academica)</font></h6>
		</div>
		<div class="col-6  text-right">
			<font color="#cccccc">
				Usuario: admin <br>
			</font>
			<input type="submit" name="btnSalir" value="Salir">
		</div>
	</div>
</div>
</form>

<form method="post" action="menu.jsp">
	<div class="container">
		<div class="row">
			<div class="col-12 pb-5"></div>
			<div class="col-12 pt-5 pb-5 text-center">
				<input type="submit" style="width:200px" name="btnAlumnos" value="Alumnos" /> <br> <br> <br>
				<input type="submit" style="width:200px" name="btnProfesores" value="Profesores" /> <br> <br> <br>
				<input type="submit" style="width:200px" name="btnCursos" value="Cursos" />
			</div>
		</div>
	</div>
</form>


<%
	if(request.getParameter("btnAlumnos") != null)
	{
		response.sendRedirect("alumnos.jsp"); 
	}

	if(request.getParameter("btnProfesores") != null)
	{
		response.sendRedirect("profesores.jsp"); 
	}

	if(request.getParameter("btnCursos") != null)
	{
		response.sendRedirect("cursosA.jsp"); 
	}
 %>


</body>
</html>