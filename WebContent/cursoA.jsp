<%@page import="dao.CursoDao"%>
<%@page import="entidad.Curso"%>
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
	if((Boolean)session.getAttribute("login") == false || (Boolean)session.getAttribute("admin") == false)
	{
		 %><jsp:forward page="login.jsp" /><%
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
				<th><font color="#cccccc">Legajo</font></th> 
				<th><font color="#cccccc">Nombre</font></th> 
				<th><font color="#cccccc">Apellido</font></th> 
				<th><font color="#cccccc">Estado</font></th> 
				<th><font color="#cccccc">1° Parcial</font></th> 
				<th><font color="#cccccc">2° Parcial</font></th>
				<th><font color="#cccccc">1° Recuperatorio</font></th> 
				<th><font color="#cccccc">2° Recuperatorio</font></th>
			 </tr>
		</thead>
		<tbody>
			<%
			CursoDao cDao = new CursoDao();
			ArrayList<Alumno> list = new ArrayList<Alumno>();
			if (request.getAttribute("idCurso")==null)
			{
				response.sendRedirect("cursosA.jsp");
			}
			else
			{
				list = cDao.obtenerNotas(Short.parseShort(request.getAttribute("idCurso").toString()));
			}
			for(Alumno item: list) {
			%>
			<tr>
				<td><%=item.getLegajoA()%> <input type="hidden" name="legajo_a" value="<%=item.getLegajoA()%>"> </td>
				<td><%=item.getNombre()%></td>
				<td><%=item.getApellido()%></td>
				<td><%String estado; if(item.notas.getEstado() == 0){estado="Regular";} else{estado="No regular";}%><%=estado%></td>
				<td><%String nota1; if(item.notas.getParcial1() == 0){nota1="-";} else{nota1=Short.toString(item.notas.getParcial1());}%><%=nota1%></td>
				<td><%String nota2; if(item.notas.getParcial2() == 0){nota2="-";} else{nota2=Short.toString(item.notas.getParcial2());}%><%=nota2%></td>
				<td><%String nota3; if(item.notas.getRecu1() == 0){nota3="-";} else{nota3=Short.toString(item.notas.getRecu1());}%><%=nota3%></td>
				<td><%String nota4; if(item.notas.getRecu2() == 0){nota4="-";} else{nota4=Short.toString(item.notas.getRecu2());}%><%=nota4%></td>
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
			<input type="submit" name="btnVolverA" value="Volver atras" formnovalidate>
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
</script>

</body>
</html>