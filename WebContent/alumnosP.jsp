<%@page import="dao.CursoDao"%>
<%@page import="entidad.Curso"%>
<%@page import="entidad.Profesor"%>
<%@page import="dao.AlumnoDao"%>
<%@page import="entidad.Alumno"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="DataTables/datatables.min.css"/>
<link rel="stylesheet" type="text/css" href="DataTables/DataTableStyle.css"/>

<%
if (session.getAttribute("login") == null)
{
	 %><jsp:forward page="login.jsp" /><%
}
else
{
	if((Boolean)session.getAttribute("login") == false)
	{
		 %><jsp:forward page="login.jsp" /><%
	}
	else
	{
		if((Boolean)session.getAttribute("admin") == true)
		{
			 %><jsp:forward page="login.jsp" /><%
		}	
	}
}
%>

<title>SGA - Curso</title>
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
			<%Profesor user = new Profesor();%>
			<%if (session.getAttribute("user")!=null)
			{%>
				Usuario: <%	user = (Profesor)session.getAttribute("user"); %><%=user.getNombre()%> <%=user.getApellido()%> <br>
			<%}%>
			</font>
			<input type="submit" name="btnSalir" value="Salir">
		</div>
	</div>
</div>
</form>

<div class="container mb-3 mt-3">
	<table id="listado" class="display">
		<thead>
			<tr> 
				<th><font color="#cccccc">Legajo</font></th> 
				<th><font color="#cccccc">Nombre</font></th> 
				<th><font color="#cccccc">Apellido</font></th> 
				<th><font color="#cccccc">DNI</font></th> 
				<th><font color="#cccccc">Genero</font></th> 
				<th><font color="#cccccc">Telefono</font></th> 
				<th><font color="#cccccc">Domicilio</font></th> 
				<th><font color="#cccccc">Nacimiento</font></th> 
				<th><font color="#cccccc">Estado</font></th> 
			</tr>
		</thead>
		<tbody>
			<%
			CursoDao cDao = new CursoDao();
			ArrayList<Alumno> list = new ArrayList<Alumno>();
			if (request.getAttribute("idCurso")==null)
			{
				response.sendRedirect("cursosP.jsp");	
			}
			else
			{
				list = cDao.obtenerAlumnosCurso(Short.parseShort(request.getAttribute("idCurso").toString()));
			}
			for(Alumno item: list) {
			%>
			<tr>
				<td><%=item.getLegajoA()%></td>
				<td><%=item.getNombre()%></td>
				<td><%=item.getApellido()%></td>
				<td><%=item.getDni()%></td>
				<td><%String genero; if(item.getGenero() == 0){genero="Masculino";} else{genero="Femenino";}%><%=genero%></td>
				<td><%=item.getTelefono()%></td>
				<td><%=item.getDomicilio()%></td>
				<td><%=item.getNacimiento()%></td>
				<td>				
					<form method="post" action="servletCurso">
						<input type="hidden" name="idCurso" value="<%=request.getAttribute("idCurso").toString()%>">
						<input type="hidden" name="legajo" value="<%=item.getLegajoA()%>">
						<%if(item.notas.getEstado()==0) { %>
							<input name="btnRegular" type="submit" value="Regular">
						<%} else { %>
							<input name="btnNoRegular" type="submit" value="No regular">
						<%}%>
					</form>
				</td>
			</tr>
			<%
			} 
			%>
		</tbody>
	</table>
</div>
<br> <br> <br> <br> <br> <br>
<form method="post" action="servletCurso">
	<div class="text-center">
		<div class="fixed-bottom">
			<input type="submit" name="btnVolverP" value="Volver atras" formnovalidate>
		</div>
	</div>
</form>



<script type="text/javascript" src="bootstrap/js/bootstrap.js"></script>
<script type="text/javascript" src="DataTables/datatables.min.js"></script>

<script type="text/javascript"> 
$(document).ready( function () {
    $('#listado').DataTable();
} );
$('#listado').DataTable( {
    "language": {
        "url": "DataTables/language.lang"
    }
} );
var table = $('#listado').DataTable();
var data = table
 .order( [ 2, 'asc' ] )
 .draw();
</script>

</body>
</html>