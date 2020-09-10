<%@page import="entidad.Profesor"%>
<%@page import="dao.ProfesorDao"%>
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
					<label style="margin-right: 65px">Nombre:</label> <br> <input type="text" name="txtNombre" value="<%=p.getNombre()%>" title="Ingrese un nombre valido" pattern="^[a-zA-Z]+( [a-zA-Z]+)*$" required > <br> <br>
					<label style="margin-right: 65px">Apellido:</label> <br> <input type="text" name="txtApellido" value="<%=p.getApellido()%>" title="Ingrese un nombre valido" pattern="^[a-zA-Z]+( [a-zA-Z]+)*$" required> <br> <br>
					<label style="margin-right: 90px">DNI:</label> <br> <input type="text" name="txtDni" value="<%=p.getDni()%>" pattern="[0-9]{8}" title="Ingrese DNI (8 digitos)" required> <br> <br>
					<label style="margin-right: 60px">Telefono:</label> <br> <input type="text" name="txtTelefono" value="<%=p.getTelefono()%>" pattern="[0-9]+" maxlength="14" title="Ingrese solo numeros" required> <br> <br>
					<label style="margin-right: 60px">Domicilio:</label> <br> <input type="text" name="txtDomicilio" value="<%=p.getDomicilio()%>" pattern="[/[\w\d\s°.,#]/g]" title="Ingrese un domicilio valido" required> <br> <br>
					<label style="margin-right: 70px">Genero:</label> <br> 	
					<%if(p.getGenero()==0) { %>
					<center>
						<select id="ddlGenero" name="ddlGenero" class="form-control" style="width:190px" value="<%=p.getGenero()%>" required>
							<option value="0">Masculino</option> 
							<option value="1">Femenino</option>
						</select>
					</center><br>
					<%} else { %>
					<center>
						<select id="ddlGenero" name="ddlGenero" class="form-control" style="width:190px" value="<%=p.getGenero()%>" required>
							<option value="1">Femenino</option>
							<option value="0">Masculino</option> 
						</select>
					</center><br>
					<%}%>
						<label style="margin-right: -20px">Fecha de nacimiento:</label> <br> <input type="date" id="dateNacimiento" name="dateNacimiento" value="<%=p.getNacimiento()%>" pattern="(?:19|20)[0-9]{2}-(?:(?:0[1-9]|1[0-2])-(?:0[1-9]|1[0-9]|2[0-9])|(?:(?!02)(?:0[1-9]|1[0-2])-(?:30))|(?:(?:0[13578]|1[02])-31))
						" required> <br> <br>
					</font>
					<div class="col-12 pt-5 text-center">
						<input type="submit" name="btnEditar" value="Editar"> <br> <br>
						<%
							if (request.getAttribute("cantFilas") != null) 
							{
								int filas = Integer.parseInt(request.getAttribute("cantFilas").toString()); 
								if(filas == 1) 
								{
									%><font color="#cccccc">Profesor modificado.</font><br><br><%
								}
								else
								{
									%><font color="#cccccc">No se pudo modificar el profesor.</font><br><br> <%
								}
							}
						%>
				</div>
			</div>
		</div>
	</div>
</form>
<br> <br> <br> <br> 
<form action="servletProfesor" method="post">
	<div class="container">
		<div class="row">
			<div class="col-12 pt-5 pb-5 text-center">
				<div class="fixed-bottom" text-center>
					<input type="submit" name="btnVolverE" value="Volver atras" formnovalidate> 
				</div>
			</div>
		</div>
	</div>
</form>

</body>
</html>