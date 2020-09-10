package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import entidad.Materia;

public class MateriaDao {

	private String host = "jdbc:mysql://localhost:3306/";
	private String user = "root";
	private String pass = "ROOT";
	private String dbName = "SGA";

	public ArrayList<Materia> obtenerMaterias() {

		ArrayList<Materia> lista = new ArrayList<Materia>();
		Connection conn = null;
		try{
			conn = DriverManager.getConnection(host + dbName, user, pass);
			Statement st = conn.createStatement();
			
			ResultSet rs = st.executeQuery("Select id_materia,nombre FROM materias");
			
			while(rs.next()){
				
				Materia maeteriaRs = new Materia();
				maeteriaRs.setIdMateria(rs.getShort("id_materia"));
				maeteriaRs.setNombre(rs.getString("nombre"));
				
				lista.add(maeteriaRs);
			}
			conn.close();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
		
		}
		
		return lista;
	}

	public Materia obtenerMateria(short id_materia)
	{

		Materia materia = new Materia();
		Connection con = null;
		try{
			con = DriverManager.getConnection(host + dbName, user, pass);
			PreparedStatement miSentencia = con.prepareStatement("Select * from materias where id_materia = ?");
			miSentencia.setInt(1, id_materia);
			ResultSet resultado = miSentencia.executeQuery();
			resultado.next();
			
			materia.setIdMateria(resultado.getShort(1));
			materia.setNombre(resultado.getString(2));
		    
		    con.close();
		}
		catch(Exception e)
		{
			System.out.println("Conexion fallida");
		}
		finally
		{
		}
		return materia;
	}
}
