<%@page import="dao.ProfesorDao"%>
<%@page import="entidad.Profesor"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link rel="stylesheet" type="text/css" href="./bootstrap/css/bootstrap.css">

<%
if (session.getAttribute("login") == null)
{
	 %><jsp:forward page="login.jsp" /><%
}
else
{
	if((Boolean)session.getAttribute("login") == false || (Boolean)session.getAttribute("admin") == false)
	{
		 %><jsp:forward page="login.jsp" /><%
	}
}
%>

<title>SGA - Editar Profesor</title>
</head>
<body style="background-color:#000000;">

<form method="post" action="servletLogin">
<div class="container-fluid full-height">
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

<%
	ProfesorDao pDao = new ProfesorDao();
	Profesor p = new Profesor();
	if (request.getAttribute("legajo")==null)
	{
		response.sendRedirect("profesores.jsp");
	}
	else
	{
		p = pDao.obtenerProfesor(Integer.parseInt(request.getAttribute("legajo").toString()));
	}
%>

<form action="servletProfesor" method="post">
	<div class="container">
		<div class="row">
			<div class="col-12 pb-5"></div>
			<div class="col-12 pt-5 pb-5 text-center">
				<font color="#cccccc">
					<input type="hidden" name="txtLegajo" id="txtLegajo" value="<%=p.getLegajoP()%>">
					<label style="margin-right: 65px">Clave:</label> <br>
					<input id="txtClave" name="txtClave" type="password" pattern="^\S{3,}$" onchange="this.setCustomValidity(this.validity.patternMismatch ? 'Debe tener al menos 3 caracteres' : ''); if(this.checkValidity()) form.txtClaveV.pattern = this.value;" required>
					<br> <br>
					<label style="margin-right: 15px">Confirme clave:</label> <br>
					<input id="txtClaveV" name="txtClaveV" type="password" pattern="^\S{3,}$" onchange="this.setCustomValidity(this.validity.patternMismatch ? 'Claves no coinciden' : '');" required>
					<br> <br>
					</font>
					<div class="col-12 pt-5 text-center">
						<input type="submit" name="btnEditarClave"> <br> <br>
						<%
							if (request.getAttribute("cantFilas") != null) 
							{
								int filas = Integer.parseInt(request.getAttribute("cantFilas").toString()); 
								if(filas == 1) 
								{
									%><font color="#cccccc">Clave modificada.</font><br><br><%
								}
								else
								{
									%><font color="#cccccc">No se pudo modificar la clave.</font><br><br> <%
								}
							}
						%>
				</div>
			</div>
		</div>
	</div>
</form>
<br> <br> <br> <br> <br> <br> 
<form action="servletProfesor" method="post">
	<div class="container">
		<div class="row">
			<div class="col-12 pt-5 pb-5 text-center">
				<div class="fixed-bottom" text-center>
					<input type="submit" name="btnVolverC" value="Volver atras" formnovalidate> 
				</div>
			</div>
		</div>
	</div>
</form>

</body>
</html>