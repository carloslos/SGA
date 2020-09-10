package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import entidad.Alumno;

public class AlumnoDao {

	private String host = "jdbc:mysql://localhost:3306/";
	private String user = "root";
	private String pass = "ROOT";
	private String dbName = "SGA";

	
	public int agregarAlumno(Alumno alumno)
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
			String query = "insert into alumnos (nombre,apellido,dni,genero,telefono,domicilio,nacimiento) values ('"+alumno.getNombre()+"','"+alumno.getApellido()+"','"+alumno.getDni()+"','"+alumno.getGenero()+"','"+alumno.getTelefono()+"','"+alumno.getDomicilio()+"','"+alumno.getNacimiento()+"')";
			filas=st.executeUpdate(query);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return filas;
	}
	
	public ArrayList<Alumno> obtenerAlumnos() {
		
		try 
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
		} 
		catch (ClassNotFoundException e) 
		{
			e.printStackTrace();
		}

		ArrayList<Alumno> lista = new ArrayList<Alumno>();
		Connection conn = null;
		try
		{
			conn = DriverManager.getConnection(host + dbName, user, pass);
			Statement st = conn.createStatement();
			
			ResultSet rs = st.executeQuery("select legajo_a,nombre,apellido,dni,genero,telefono,domicilio,nacimiento from alumnos where activo = 1");
			
			while(rs.next()){
				
				Alumno alumnos = new Alumno();
				alumnos.setLegajoA(rs.getInt("legajo_a"));
				alumnos.setNombre(rs.getString("nombre"));
				alumnos.setApellido(rs.getString("apellido"));
				alumnos.setDni(rs.getInt("dni"));
				alumnos.setGenero(rs.getShort("genero"));
				alumnos.setTelefono(rs.getInt("telefono"));
				alumnos.setDomicilio(rs.getString("domicilio"));
				alumnos.setNacimiento(rs.getDate("nacimiento"));
				
				lista.add(alumnos);
			}
			conn.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return lista;
	}

	public Alumno obtenerAlumno(int legajo_a)
	{
		try 
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
		} 
		catch (ClassNotFoundException e) 
		{
			e.printStackTrace();
		}

		Alumno alumno = new Alumno();
		Connection con = null;
		try
		{
			con = DriverManager.getConnection(host + dbName, user, pass);
			PreparedStatement miSentencia = con.prepareStatement("select * from alumnos where legajo_a = ? and activo = 1");
			miSentencia.setInt(1, legajo_a);
			ResultSet resultado = miSentencia.executeQuery();
			resultado.next();
			
			alumno.setLegajoA(resultado.getInt(1));
			alumno.setNombre(resultado.getString(2));
			alumno.setApellido(resultado.getString(3));
			alumno.setDni(resultado.getInt(4));
			alumno.setGenero(resultado.getShort(5));
			alumno.setTelefono(resultado.getInt(6));
			alumno.setDomicilio(resultado.getString(7));
			alumno.setNacimiento(resultado.getDate(8));
		    
		    con.close();
		}
		catch(Exception e)
		{
			System.out.println("Conexion fallida");
		}
		return alumno;
	}
	
	public int editarAlumno(Alumno alumno)
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
			PreparedStatement miSentencia = con.prepareStatement("update alumnos set nombre=?,apellido=?,dni=?,telefono=?,genero=?,domicilio=?,nacimiento=? where legajo_a=?");
			miSentencia.setString(1, alumno.getNombre());
			miSentencia.setString(2, alumno.getApellido());
			miSentencia.setInt(3, alumno.getDni());
			miSentencia.setInt(4, alumno.getTelefono());
			miSentencia.setShort(5, alumno.getGenero());
			miSentencia.setString(6, alumno.getDomicilio());
			java.sql.Date date = new java.sql.Date(alumno.getNacimiento().getTime());			
			miSentencia.setDate(7, date);
			miSentencia.setInt(8, alumno.getLegajoA());
			filas = miSentencia.executeUpdate();
			
		    con.close();
		}
		catch(Exception e)
		{
			System.out.println("Conexion fallida");
		}
		return filas;      
	}
	
	public Boolean alumnoLibre(int legajo) 
	{
		try 
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
		} 
		catch (ClassNotFoundException e) 
		{
			e.printStackTrace();
		}
		int cant = 0;
		Boolean res = true;
		Connection con = null;
		try
		{
			con = DriverManager.getConnection(host + dbName, user, pass);
			PreparedStatement miSentencia = con.prepareStatement("select id_curso from alumnos_x_curso where legajo_a = ?");
			miSentencia.setInt(1, legajo);
			ResultSet resultado = miSentencia.executeQuery();
			while(resultado.next())
			{
				cant++;
			}
			if(cant>0)
				{res = false;}
		    
		    con.close();
		}
		catch(Exception e)
		{
			System.out.println("Conexion fallida");
		}
		return res;
	}

	public void eliminarAlumno(int legajo_a)
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
			PreparedStatement miSentencia = con.prepareStatement("update alumnos set activo=? where legajo_a=?");
			miSentencia.setShort(1, (short) 0);
			miSentencia.setInt(2, legajo_a);
			miSentencia.executeUpdate();
			
		    con.close();
		}
		catch(Exception e)
		{
			System.out.println("Conexion fallida");
		}  
	}
	
	public void deletearAlumno(int legajo_a)
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
			PreparedStatement miSentencia = con.prepareStatement("delete from alumnos where legajo_a = ?");
			miSentencia.setInt(1, legajo_a);
			miSentencia.execute();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
}
