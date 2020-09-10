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
			 %><jsp:forward page="menu.jsp" /><%
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

<form action="servletCurso" method="post">
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
					response.sendRedirect("cursosP.jsp");	
				}
				else
				{
					list = cDao.obtenerNotas(Short.parseShort(request.getAttribute("idCurso").toString()));
				}
				for(Alumno item: list) {
				%>
				<tr>
					<td><%=item.getLegajoA()%> <input type="hidden" name="legajo_a" value="<%=item.getLegajoA()%>"> </td>
					<td><%=item.getNombre()%> <input type="hidden" name="idCurso" value="<%=Short.parseShort(request.getAttribute("idCurso").toString())%>"></td>
					<td><%=item.getApellido()%></td>
					<td><%String estado; if(item.notas.getEstado() == 0){estado="Regular";} else{estado="No regular";}%><%=estado%>	</td>
					<td>
						<%String parcial1 = (item.notas.getParcial1()>0) ? Short.toString(item.notas.getParcial1()) : "" ; %>
						<%String sParcial1 = "parcial1_" + item.getLegajoA();%>
						<%if(item.notas.getEstado()==0) {%>
							<input type="number" name="<%=sParcial1%>" value="<%=parcial1%>" max="10" min="1">
						<%} else {%>
							<%=parcial1%>
						<%}%>
					</td>
					<td>
						<%String parcial2 = (item.notas.getParcial2()>0) ? Short.toString(item.notas.getParcial2()) : "" ; %>
						<%String sParcial2 = "parcial2_" + item.getLegajoA();%>
						<%if(item.notas.getEstado()==0) {%>
							<input type="number" name="<%=sParcial2%>" value="<%=parcial2%>" max="10" min="1">
						<%} else {%>
							<%=parcial2%>
						<%}%>
					</td>
					<td>
						<%String recu1 = (item.notas.getRecu1()>0) ? Short.toString(item.notas.getRecu1()) : "" ; %>
						<%String sRecu1 = "recu1_" + item.getLegajoA();%>
						<%if(item.notas.getEstado()==0) {%>
							<input type="number" name="<%=sRecu1%>" value="<%=recu1%>" max="10" min="1">
						<%} else {%>
							<%=recu1%>
						<%}%>
					</td>
					<td>
						<%String recu2 = (item.notas.getRecu2()>0) ? Short.toString(item.notas.getRecu2()) : "" ; %>
						<%String sRecu2 = "recu2_" + item.getLegajoA();%>
						<%if(item.notas.getEstado()==0) {%>
							<input type="number" name="<%=sRecu2%>" value="<%=recu2%>" max="10" min="1">
						<%} else {%>
							<%=recu2%>
						<%}%>
					</td>
				</tr>
				<%
				} 
				%>	
			</tbody>
		</table>
	</div>
	<div class="col-12 pt-5 text-center">
		<%if(!list.isEmpty()) {%>
		<input type="submit" name="btnGuardar" value="Guardar"> <br> <br>
		<%} %>
		<%
			if (request.getAttribute("cantFilas") != null) 
			{
				int filas = 0;
				filas = Integer.parseInt(request.getAttribute("cantFilas").toString()); 
				if(filas >= 1) 
				{
					%><font color="#cccccc">Calificaciones guardadas.</font><br><br><%
				}
				else
				{
					%><font color="#cccccc">No se pudieron guardar los cambios.</font><br><br><%
				} 
			}
		%>
	</div>
</form>
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
$(document).ready(function() {
    $('#listado').DataTable( {
        "paging":  false,
        "language": {
            "url": "DataTables/language.lang"
        }
    } );
} );
</script>

</body>
</html>