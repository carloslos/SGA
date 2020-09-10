<%@page import="dao.MateriaDao"%>
<%@page import="entidad.Materia"%>
<%@page import="dao.ProfesorDao"%>
<%@page import="entidad.Profesor"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link rel="stylesheet" type="text/css" href="./bootstrap/css/bootstrap.css">

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

<title>SGA - Agregar Curso</title>
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

<form action="servletCurso" method="post">
	<div class="container">
		<div class="row">
			<div class="col-12 pb-5"></div>
			<div class="col-12 pt-5 pb-5 text-center">
				<font color="#cccccc"><label style="margin-right: 180px">Materia:</label></font> <br> 
				<center>
					<select id="ddlMateria" name="ddlMateria" class="form-control" style="width:260px" required>
						<option value="">Seleccione materia</option>
						<% 
						   	try
							{
						   		String Query = "SELECT id_materia,nombre FROM materias";
						   		Class.forName("com.mysql.cj.jdbc.Driver"); 					     
						   		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/SGA","root", "ROOT");
							   		Statement stm = conn.createStatement();
							   		ResultSet rs = stm.executeQuery(Query);
							   		while(rs.next())
								    {           
									    %>
									    <option value="<%=rs.getInt("id_materia")%>"><%=rs.getString("nombre") %></option>
									    <%
							   		}
							    }
								catch(Exception e)
								{
									e.printStackTrace();
							    }
							%>
						</select><br> <br>  
					</center>
					<font color="#cccccc"><label style="margin-right: 180px">Profesor:</label></font><br>
					<center>
						<select id="ddlProfesor" name="ddlProfesor" class="form-control" style="width:260px" required>
							<option value="">Seleccione profesor</option>
							<% 
							   	try
								{
							   		String Query = "SELECT legajo_p,nombre,apellido FROM profesores";
							   		Class.forName("com.mysql.cj.jdbc.Driver");						     
							   		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/SGA","root", "ROOT");
							   		Statement stm = conn.createStatement();
							   		ResultSet rs = stm.executeQuery(Query);
							   		while(rs.next())
							    	{           
									    %>
								   		<option value="<%=rs.getShort("legajo_p")%>"><%=rs.getShort("legajo_p")+" - "+rs.getString("nombre")+" "+rs.getString("apellido")%></option>
								    	<%
						   			}
						    	}
								catch(Exception e)
								{
									e.printStackTrace();
						    	}
					    	%>
					</select>
					</center>
				<br><br>
				<font color="#cccccc"><label style="margin-right: 180px">Periodo:</label></font><br> 
				<input type="number" id="datePeriodo" name="datePeriodo" min="2000" max="2099" step="1" value="2019" title="Ingrese un año entre 2000 y 2099" required><br> <br> 
				<font color="#cccccc"><label style="margin-right: 140px">Cuatrimestre:</label></font><br> 
				<center><select id="ddlCuatrimestre" name="ddlCuatrimestre" class="form-control" style="width:250px" required>
						<option value="">Seleccione cuatrimestre</option>
						<option value="0">Primer cuatrimestre</option>
						<option value="1">Segundo cuatrimestre</option>
						</select></center>
				<br> <br> <br> <br> 
				<input type="submit" name="btnRegistrar" value="Registrar"> <br> <br>
				<%
					if (request.getAttribute("cantFilas") != null) 
					{
						int filas = 0;
						filas = Integer.parseInt(request.getAttribute("cantFilas").toString()); 
						if(filas == 1) 
						{
							%><font color="#cccccc">Curso registrado.</font><%
						}
							else
						{
							%><font color="#cccccc">No se pudo registrar el curso.</font><%
						} 
					}
				%>
			</div>
		</div>
	</div>
</form>
<br> <br> <br> <br> <br> <br> 
<form action="servletCurso" method="post">
	<div class="container">
		<div class="row">
			<div class="col-12 pt-5 pb-5 text-center">
				<div class="fixed-bottom" text-center>
					<input type="submit" name="btnVolverA" value="Volver atras" formnovalidate> 
				</div>
			</div>
		</div>
	</div>
</form>

</body>
</html>