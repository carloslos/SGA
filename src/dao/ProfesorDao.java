package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import entidad.Profesor;

public class ProfesorDao {

	private String host = "jdbc:mysql://localhost:3306/";
	private String user = "root";
	private String pass = "ROOT";
	private String dbName = "SGA";

	
	public int agregarProfesor(Profesor profesor)
	{
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
	
		int filas=0;
		Connection cn = null;
		try
		{
			cn = DriverManager.getConnection(host+dbName,user,pass);
			Statement st = cn.createStatement();
			String query = "Insert into profesores (nombre,apellido,dni,clave,genero,telefono,domicilio,nacimiento) values ('"+profesor.getNombre()+"','"+profesor.getApellido()+"','"+profesor.getDni()+"','"+profesor.getClave()+"','"+profesor.getGenero()+"','"+profesor.getTelefono()+"','"+profesor.getDomicilio()+"','"+profesor.getNacimiento()+"')";
			filas=st.executeUpdate(query);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return filas;
	}
	
	public ArrayList<Profesor> obtenerProfesores() {
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		ArrayList<Profesor> lista = new ArrayList<Profesor>();
		Connection conn = null;
		try{
			conn = DriverManager.getConnection(host + dbName, user, pass);
			Statement st = conn.createStatement();
			
			ResultSet rs = st.executeQuery("Select legajo_p,nombre,apellido,dni,clave,genero,telefono,domicilio,nacimiento FROM profesores where activo = 1");
			
			while(rs.next()){
				
				Profesor profesores = new Profesor();
				profesores.setLegajoP(rs.getInt("legajo_p"));
				profesores.setNombre(rs.getString("nombre"));
				profesores.setApellido(rs.getString("apellido"));
				profesores.setDni(rs.getInt("dni"));
				profesores.setClave(rs.getString("clave"));
				profesores.setGenero(rs.getShort("genero"));
				profesores.setTelefono(rs.getInt("telefono"));
				profesores.setDomicilio(rs.getString("domicilio"));
				profesores.setNacimiento(rs.getDate("nacimiento"));
				
				
				lista.add(profesores);
			}
			conn.close();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
		
		}
		
		return lista;
	}

	
	
	public Profesor obtenerProfesor(int legajo_p)
	{
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		Profesor profesor = new Profesor();
		Connection con = null;
		try{
			con = DriverManager.getConnection(host + dbName, user, pass);
			PreparedStatement miSentencia = con.prepareStatement("Select * from profesores where legajo_p = ? and activo = 1");
			miSentencia.setInt(1, legajo_p);
			ResultSet resultado = miSentencia.executeQuery();
			resultado.next();
			
			profesor.setLegajoP(resultado.getInt(1));			
			profesor.setNombre(resultado.getString(2));
			profesor.setApellido(resultado.getString(3));
			profesor.setDni(resultado.getInt(4));
			profesor.setClave(resultado.getString(5));
			profesor.setGenero(resultado.getShort(6));
			profesor.setTelefono(resultado.getInt(7));
			profesor.setDomicilio(resultado.getString(8));
			profesor.setNacimiento(resultado.getDate(9));
		    
		    con.close();
		}
		catch(Exception e)
		{
			System.out.println("Conexion fallida");
		}
		finally
		{
		}
		return profesor;
	}
	
	public Boolean profesorLibre(int legajo) 
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
			PreparedStatement miSentencia = con.prepareStatement("select id_curso from cursos where legajo_p = ?");
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

	 
	 public Profesor loginProfesor(String inLegajo, String inClave)
	   {
		 
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}

			Profesor profesor = new Profesor();
			Connection con = null;
			try{
				con = DriverManager.getConnection(host + dbName, user, pass);
				PreparedStatement miSentencia = con.prepareStatement("Select legajo_p,clave,nombre,apellido from profesores where legajo_p = ? and activo = 1");
				miSentencia.setInt(1, Integer.parseInt(inLegajo));
				ResultSet resultado = miSentencia.executeQuery();
				resultado.next();
				
				profesor.setLegajoP(resultado.getInt(1));			
				profesor.setClave(resultado.getString(2));
				profesor.setNombre(resultado.getString(3));
				profesor.setApellido(resultado.getString(4));
			    
			    con.close();
			}
			catch(Exception e)
			{
				System.out.println("Conexion fallida");
			}
			finally
			{
			}
			return profesor;
	   }
	 
		public int editarProfesor(Profesor profesor)
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
				PreparedStatement miSentencia = con.prepareStatement("update profesores set nombre=?,apellido=?,dni=?,telefono=?,genero=?,domicilio=?,nacimiento=? where legajo_p=?");
				miSentencia.setString(1, profesor.getNombre());
				miSentencia.setString(2, profesor.getApellido());
				miSentencia.setInt(3, profesor.getDni());
				miSentencia.setInt(4, profesor.getTelefono());
				miSentencia.setShort(5, profesor.getGenero());
				miSentencia.setString(6, profesor.getDomicilio());
				java.sql.Date date = new java.sql.Date(profesor.getNacimiento().getTime());			
				miSentencia.setDate(7, date);
				miSentencia.setInt(8, profesor.getLegajoP());
				filas = miSentencia.executeUpdate();
				
			    con.close();
			}
			catch(Exception e)
			{
				System.out.println("Conexion fallida");
			}
			return filas;      
		}
		
		public int editarClave(Profesor profesor)
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
				PreparedStatement miSentencia = con.prepareStatement("update profesores set clave=? where legajo_p=?");
				miSentencia.setString(1, profesor.getClave());
				miSentencia.setInt(2, profesor.getLegajoP());
				filas = miSentencia.executeUpdate();
				
			    con.close();
			}
			catch(Exception e)
			{
				System.out.println("Conexion fallida");
			}
			return filas;      
		}
		
		public void eliminarProfesor(int legajo_p)
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
				PreparedStatement miSentencia = con.prepareStatement("update profesores set activo=? where legajo_p=?");
				miSentencia.setShort(1, (short) 0);
				miSentencia.setInt(2, legajo_p);
				miSentencia.executeUpdate();
				
			    con.close();
			}
			catch(Exception e)
			{
				System.out.println("Conexion fallida");
			}  
		}
	 
		public void deletearProfesor(int legajo_p)
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
				PreparedStatement miSentencia = con.prepareStatement("delete from profesores where legajo_a = ?");
				miSentencia.setInt(1, legajo_p);
				miSentencia.execute();
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
		}
}
