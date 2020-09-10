<%@page import="dao.CursoDao"%>
<%@page import="entidad.Curso"%>
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

<title>SGA - Cursos</title>
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
	<table id="listado" class="display">
		<thead>
			<tr>
				<th><font color="#cccccc">Curso</font></th> 
				<th><font color="#cccccc">Materia</font></th> 
				<th><font color="#cccccc">Periodo</font></th> 
				<th><font color="#cccccc">Cuatrimestre</font></th> 
				<th><font color="#cccccc">Profesor</font></th> 
				<th><font color="#cccccc">Acciones</font></th>
			 </tr>
		</thead>
		<tbody>
			<%
			CursoDao dao = new CursoDao();
			ArrayList<Curso> list = dao.obtenerCursos();
			for(Curso item: list) {
			%>
			<tr>
				<td><%=item.getIdCurso()%></td>
				<td><%=item.getMateria()%></td>
				<td><%=item.getPeriodo()%></td>
				<td><%String cuatrimestre; if(item.getCuatrimestre() == 0){cuatrimestre="Primer cuatrimestre";} else{cuatrimestre="Segundo cuatrimestre";}%><%=cuatrimestre%></td>
				<td>[<%=item.getLegajoP()%>] <%=item.getNombreP() +" "%><%=item.getApellidoP()%></td>
				<td>
					<form method="post" action="servletCurso">
					 	<input type="hidden" name="cursoEdit" value="<%=item.getIdCurso()%>">
					 	<button type="submit" name="btnVisualizarA"> 
							Visualizar
						</button>
					 	<button type="submit" name="btnAsignarAlumnos">
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
<br> <br> <br> <br> 
<form method="post" action="servletCurso">
	<div class="text-center">
		<input type="submit" name="btnAgregar" value="Registrar Curso" /> <br> <br> <br> <br> <br> <br>
		<div class="fixed-bottom">
			<input type="submit" name="btnVolver" value="Volver atras"> 
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
 .order( [ 2, 'desc' ], [ 3, 'asc' ] )
 .draw();
</script>

</body>
</html>