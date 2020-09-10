<%@page import="dao.CursoDao"%>
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
	if((Boolean)session.getAttribute("login") == false || (Boolean)session.getAttribute("admin") == false)
	{
		 %><jsp:forward page="login.jsp" /><%
	}
}
%>

<title>SGA - Asignar Alumnos</title>
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

<div class="container mb-3 mt-3">
	<table id="curso" class="display">
		<thead>
			<tr>
				<th><font color="#cccccc">Legajo</font></th> 
				<th><font color="#cccccc">Nombre</font></th> 
				<th><font color="#cccccc">Apellido</font></th> 
				<th><font color="#cccccc">DNI</font></th> 
				<th><font color="#cccccc">Acciones</font></th> 
			 </tr>
		</thead>
		<tbody>
			<%
			CursoDao cDao = new CursoDao();
			ArrayList<Alumno> listC = new ArrayList<Alumno>();
			if (request.getAttribute("idCurso")==null)
			{
				response.sendRedirect("cursosA.jsp");	
			}
			else
			{
				listC = cDao.obtenerAlumnosCurso(Short.parseShort(request.getAttribute("idCurso").toString()));
			}
			for(Alumno item: listC) {
			%>
			<tr>
				<td><%=item.getLegajoA()%></td>
				<td><%=item.getNombre()%></td>
				<td><%=item.getApellido()%></td>
				<td><%=item.getDni()%></td>
				<td>
					<form method="post" action="servletCurso">
					 	<input type="hidden" name="alumnoEdit" value="<%=item.getLegajoA()%>">
					 	<input type="hidden" name="cursoEdit" value="<%=Short.parseShort(request.getAttribute("idCurso").toString())%>">
					 	<button type="submit" name="btnQuitar">
					 		Quitar
					 	</button>
					</form>
				</td>
			</tr>
			<%
			} 
			%>
		</tbody>
	</table>
</div> 
<br> <br> <br>
<div class="container mb-3 mt-3">
	<table id="noCurso" class="display">
		<thead>
			<tr>
				<th><font color="#cccccc">Legajo</font></th> 
				<th><font color="#cccccc">Nombre</font></th> 
				<th><font color="#cccccc">Apellido</font></th> 
				<th><font color="#cccccc">DNI</font></th> 
				<th><font color="#cccccc">Acciones</font></th> 
			 </tr>
		</thead>
		<tbody>
			<%
			ArrayList<Alumno> listA = new ArrayList<Alumno>();
			if (request.getAttribute("idCurso")==null)
			{
				response.sendRedirect("cursosA.jsp");	
			}
			else
			{
				listA = cDao.obtenerAlumnosNoCurso(cDao.obtenerCurso(Short.parseShort(request.getAttribute("idCurso").toString())));
			}
			for(Alumno item: listA) {
			%>
			<tr>
				<td><%=item.getLegajoA()%></td>
				<td><%=item.getNombre()%></td>
				<td><%=item.getApellido()%></td>
				<td><%=item.getDni()%></td>
				<td>
					<form method="post" action="servletCurso">
					 	<input type="hidden" name="alumnoEdit" value="<%=item.getLegajoA()%>">
					 	<input type="hidden" name="cursoEdit" value="<%=Short.parseShort(request.getAttribute("idCurso").toString())%>">
					 	<button type="submit" name="btnAsignar">
					 		Asignar
					 	</button>
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
			<input type="submit" name="btnVolverA" value="Volver atras">
		</div>
	</div>
</form>


<script type="text/javascript" src="bootstrap/js/bootstrap.js"></script>
<script type="text/javascript" src="DataTables/datatables.min.js"></script>

<script type="text/javascript"> 
$(document).ready( function () {
    $('#curso').DataTable();
} );
$('#curso').DataTable( {
    "language": {
        "url": "DataTables/language.lang"
    }
} );
var tablec = $('#curso').DataTable();
var datac = tablec
 .order( [ 2, 'asc' ] )
 .draw();
</script>
<script type="text/javascript"> 
$(document).ready( function () {
    $('#noCurso').DataTable();
} );
$('#noCurso').DataTable( {
    "language": {
        "url": "DataTables/language.lang",
    }
} );
var tablen = $('#noCurso').DataTable();
var datan = tablen
.order( [ 2, 'asc' ] )
.draw();
</script>

</body>
</html>