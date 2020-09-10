package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Types;
import java.util.ArrayList;

import entidad.Alumno;
import entidad.Curso;

public class CursoDao {

	private String host = "jdbc:mysql://localhost:3306/";
	private String user = "root";
	private String pass = "ROOT";
	private String dbName = "SGA";

	
	public int agregarCurso(Curso curso)
	{
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	
		int filas=0;
		Connection cn = null;
		try
		{
			cn = DriverManager.getConnection(host+dbName, user,pass);
			Statement st = cn.createStatement();
			String query = "Insert into cursos(id_materia,legajo_p,periodo,cuatrimestre) values ('"+curso.getIdMateria()+"','"+curso.getLegajoP()+"','"+curso.getPeriodo()+"','"+curso.getCuatrimestre()+"')";
			filas=st.executeUpdate(query);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return filas;
	}
	
	public ArrayList<Curso> obtenerCursos() // TODOS LOS CURSOS
	{
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		ArrayList<Curso> lista = new ArrayList<Curso>();
		Connection conn = null;
		try{
			conn = DriverManager.getConnection(host + dbName, user, pass);
			Statement st = conn.createStatement();
			String consulta = "select c.id_curso,c.id_materia,c.legajo_p,p.nombre,p.apellido,m.nombre,c.periodo,c.cuatrimestre from cursos as c " +
							  "inner join profesores as p on p.legajo_p = c.legajo_p " +
							  "inner join materias as m on m.id_materia = c.id_materia";
			ResultSet rs = st.executeQuery(consulta);
			
			while(rs.next())
			{
				Curso cursoRs = new Curso();
				cursoRs.setIdCurso(rs.getShort(1));
				cursoRs.setIdMateria(rs.getShort(2));
				cursoRs.setLegajoP(rs.getInt(3));
				cursoRs.setNombreP(rs.getString(4));
				cursoRs.setApellidoP(rs.getString(5));
				cursoRs.setMateria(rs.getString(6));	
				cursoRs.setPeriodo(rs.getShort(7));
				cursoRs.setCuatrimestre(rs.getShort(8));	
				
				lista.add(cursoRs);
			}
			conn.close();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
		
		}
		
		return lista;
	}
	
	public ArrayList<Curso> obtenerCursosP(int legajo_p) // CURSOS DE UN PROFESOR
	{ 
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		ArrayList<Curso> lista = new ArrayList<Curso>();
		Connection conn = null;
		try
		{
			conn = DriverManager.getConnection(host + dbName, user, pass);
			String consulta = "select c.id_curso,c.id_materia,c.legajo_p,p.nombre,p.apellido,m.nombre,c.periodo,c.cuatrimestre from cursos as c " +
							  "inner join profesores as p on p.legajo_p = c.legajo_p " +
							  "inner join materias as m on m.id_materia = c.id_materia " +
							  "where c.legajo_p = ?";
			PreparedStatement st = conn.prepareStatement(consulta);
			st.setInt(1, legajo_p);
			ResultSet rs = st.executeQuery();
			
			while(rs.next())
			{
				Curso cursoRs = new Curso();
				cursoRs.setIdCurso(rs.getShort(1));
				cursoRs.setIdMateria(rs.getShort(2));
				cursoRs.setLegajoP(rs.getInt(3));
				cursoRs.setNombreP(rs.getString(4));
				cursoRs.setApellidoP(rs.getString(5));
				cursoRs.setMateria(rs.getString(6));	
				cursoRs.setPeriodo(rs.getShort(7));
				cursoRs.setCuatrimestre(rs.getShort(8));	
				
				lista.add(cursoRs);
			}
			conn.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return lista;
	}
	
	public ArrayList<Alumno> obtenerNotas(short id_curso) // ALUMNOS CON NOTAS DE UN CURSO
	{
		try 
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
		} 
		catch (ClassNotFoundException e) 
		{
			e.printStackTrace();
		}

		ArrayList<Alumno> lista = new ArrayList<Alumno>();
		Connection con = null;
		try
		{
			con = DriverManager.getConnection(host + dbName, user, pass);
			PreparedStatement miSentencia = con.prepareStatement("select a.legajo_a, a.nombre, a.apellido, axc.estado, axc.parcial1, axc.parcial2, axc.recu1, axc.recu2 from alumnos_x_curso as axc " +
					"inner join alumnos as a on axc.legajo_a = a.legajo_a " +
					"where axc.id_curso = ? and a.activo = 1");
			miSentencia.setInt(1, id_curso);
			ResultSet resultado = miSentencia.executeQuery();
			
			while(resultado.next())
			{
				Alumno alumno = new Alumno();
				alumno.setLegajoA(resultado.getInt(1));
				alumno.setNombre(resultado.getString(2));
				alumno.setApellido(resultado.getString(3));
				alumno.notas.setEstado(resultado.getShort(4));
				alumno.notas.setParcial1(resultado.getShort(5));
				alumno.notas.setParcial2(resultado.getShort(6));
				alumno.notas.setRecu1(resultado.getShort(7));
				alumno.notas.setRecu2(resultado.getShort(8));
				
				lista.add(alumno);
			}
			con.close();
		}
		catch(Exception e)
		{
			System.out.println("Conexion fallida");
		}
		return lista;
	}
	
	public int guardarNotas(Alumno alumno, short idCurso)
	{
		try 
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
		} 
		catch (ClassNotFoundException e) 
		{
			e.printStackTrace();
		}
		int filas=0;
		Connection con = null;
		try
		{
			con = DriverManager.getConnection(host + dbName, user, pass);
			PreparedStatement miSentencia = con.prepareStatement("update alumnos_x_curso set parcial1=?,parcial2=?,recu1=?,recu2=? where legajo_a=? and id_curso=?");
			
			if(alumno.notas.getParcial1()!=0)
				miSentencia.setShort(1, alumno.notas.getParcial1());
			else
				miSentencia.setNull(1, Types.SMALLINT);
			
			if(alumno.notas.getParcial2()!=0)
				miSentencia.setShort(2, alumno.notas.getParcial2());
			else
				miSentencia.setNull(2, Types.SMALLINT);
			
			if(alumno.notas.getRecu1()!=0)
				miSentencia.setShort(3, alumno.notas.getRecu1());
			else
				miSentencia.setNull(3, Types.SMALLINT);
			
			if(alumno.notas.getRecu2()!=0)
				miSentencia.setShort(4, alumno.notas.getRecu2());
			else
				miSentencia.setNull(4, Types.SMALLINT);
			
			miSentencia.setInt(5, alumno.getLegajoA());
			miSentencia.setShort(6, idCurso);
			filas = miSentencia.executeUpdate();
			
		    con.close();
		}
		catch(Exception e)
		{
			System.out.println("Conexion fallida");
		}
		return filas;      
	}
	
	public void cambiarEstado(short idCurso, int legajo, short estado)
	{
		try 
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
		} 
		catch (ClassNotFoundException e) 
		{
			e.printStackTrace();
		}
		Connection con = null;
		try
		{
			con = DriverManager.getConnection(host + dbName, user, pass);
			PreparedStatement miSentencia = con.prepareStatement("update alumnos_x_curso set estado=? where legajo_a=? and id_curso=?");
			miSentencia.setShort(1, estado);
			miSentencia.setInt(2, legajo);
			miSentencia.setShort(3, idCurso);
			miSentencia.executeUpdate();
			
		    con.close();
		}
		catch(Exception e)
		{
			System.out.println("Conexion fallida");
		}     
	}
	
	public ArrayList<Alumno> obtenerAlumnosCurso(short id_curso) // ALUMNOS DE UN CURSO
	{
		try 
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
		} 
		catch (ClassNotFoundException e) 
		{
			e.printStackTrace();
		}

		ArrayList<Alumno> lista = new ArrayList<Alumno>();
		Connection con = null;
		try
		{
			con = DriverManager.getConnection(host + dbName, user, pass);
			PreparedStatement miSentencia = con.prepareStatement("select a.legajo_a, a.nombre, a.apellido, a.dni, a.telefono, a.domicilio, a.nacimiento, axc.estado from alumnos_x_curso as axc " +
					"inner join alumnos as a on axc.legajo_a = a.legajo_a " +
					"where axc.id_curso = ? and a.activo = 1");
			miSentencia.setShort(1, id_curso);
			ResultSet resultado = miSentencia.executeQuery();
			
			while(resultado.next())
			{
				Alumno alumno = new Alumno();
				alumno.setLegajoA(resultado.getInt(1));
				alumno.setNombre(resultado.getString(2));
				alumno.setApellido(resultado.getString(3));
				alumno.setDni(resultado.getInt(4));
				alumno.setTelefono(resultado.getInt(5));
				alumno.setDomicilio(resultado.getString(6));
				alumno.setNacimiento(resultado.getDate(7));
				alumno.notas.setEstado(resultado.getShort(8));
				
				lista.add(alumno);
			}
			con.close();
		}
		catch(Exception e)
		{
			System.out.println("Conexion fallida");
		}
		return lista;
	}
	
	public ArrayList<Alumno> obtenerAlumnosNoCurso(Curso c) // ALUMNOS QUE NO SON DE UN CURSO
	{
		try 
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
		} 
		catch (ClassNotFoundException e) 
		{
			e.printStackTrace();
		}

		ArrayList<Alumno> lista = new ArrayList<Alumno>();
		Connection con = null;
		try
		{
			con = DriverManager.getConnection(host + dbName, user, pass);
			PreparedStatement miSentencia = con.prepareStatement("select a.legajo_a, a.nombre, a.apellido, a.dni from alumnos as a where a.activo = 1 and a.legajo_a not in ( " + 
					"select axc.legajo_a from alumnos_x_curso as axc " + 
					"inner join alumnos as a on axc.legajo_a = a.legajo_a " + 
					"where axc.id_curso = ?) and a.legajo_a not in ( " + 
					"select axc.legajo_a from alumnos_x_curso as axc " +
	                "inner join cursos as c on axc.id_curso = c.id_curso " +
	                "where c.id_materia = ? and c.periodo = ? and c.cuatrimestre = ?)");
			miSentencia.setShort(1, (short)c.getIdCurso());
			miSentencia.setShort(2, (short)c.getIdMateria());
			miSentencia.setShort(3, c.getPeriodo());
			miSentencia.setShort(4, c.getCuatrimestre());
			ResultSet resultado = miSentencia.executeQuery();

			while(resultado.next())
			{
				Alumno alumno = new Alumno();
				alumno.setLegajoA(resultado.getInt(1));
				alumno.setNombre(resultado.getString(2));
				alumno.setApellido(resultado.getString(3));
				alumno.setDni(resultado.getInt(4));
				
				lista.add(alumno);
			}
			con.close();
		}
		catch(Exception e)
		{
			System.out.println("Conexion fallida");
		}
		return lista;
	}
	
	public int asignarAlumno(short id_curso, int legajo_a)
	{
		
		try 
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
		} 
		catch (ClassNotFoundException e) 
		{
			e.printStackTrace();
		}
		int filas=0;
		Connection cn = null;
		try
		{
			cn = DriverManager.getConnection(host+dbName,user,pass);
			Statement st = cn.createStatement();
			String query = "insert into alumnos_x_curso (id_curso, legajo_a) values ('"+id_curso+"','"+legajo_a+"')";
			filas=st.executeUpdate(query);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return filas;
	}
	
	public void quitarAlumno(short id_curso, int legajo_a)
	{
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
		} 
		catch (ClassNotFoundException e) 
		{
			e.printStackTrace();
		}
		Connection con = null;
		try
		{
			con = DriverManager.getConnection(host + dbName, user, pass);
			PreparedStatement miSentencia = con.prepareStatement("delete from alumnos_x_curso where id_curso = ? and legajo_a = ?");
			miSentencia.setInt(1, id_curso);
			miSentencia.setInt(2, legajo_a);
			miSentencia.execute();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

	public Curso obtenerCurso(int id) // PROFESOR Y MATERIA DE UN CURSO
	{
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		Curso curso = new Curso();
		Connection con = null;
		try{
			con = DriverManager.getConnection(host + dbName, user, pass);
			String consulta = "Select c.id_curso,c.id_materia,c.legajo_p,p.nombre,p.apellido,m.nombre,c.periodo,c.cuatrimestre FROM cursos as c " +
					  "inner join profesores as p on p.legajo_p = c.legajo_p " +
					  "inner join materias as m on m.id_materia = c.id_materia " +
					  "where id_curso = ?";
					  
			PreparedStatement miSentencia = con.prepareStatement(consulta);
			miSentencia.setInt(1, id);
			ResultSet resultado = miSentencia.executeQuery();
			resultado.next();
			
			curso.setIdCurso(resultado.getShort(1));
			curso.setIdMateria(resultado.getShort(2));
			curso.setLegajoP(resultado.getInt(3));
			curso.setNombreP(resultado.getString(4));
			curso.setApellidoP(resultado.getString(5));
			curso.setMateria(resultado.getString(6));
			curso.setPeriodo(resultado.getShort(7));
			curso.setCuatrimestre(resultado.getShort(8));
		
		    con.close();
		}
		catch(Exception e)
		{
			System.out.println("Conexion fallida");
		}
		finally
		{
		}
		return curso;
	}
}
