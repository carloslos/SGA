package entidad;

import java.util.Date;

public class Profesor {

	private int legajo_p;
	private String nombre;
	private String apellido;
	private int dni;
	private String clave;
	private short genero;
	private int telefono;
	private String domicilio;
	private Date nacimiento;
	
	public Profesor()
	{}

	public Profesor(int id, String nombre, String apellido) {
		this.legajo_p = id;
		this.nombre = nombre;
		this.apellido = apellido;
	}

	public int getLegajoP() {
		return legajo_p;
	}

	public void setLegajoP(int legajo_p) {
		this.legajo_p = legajo_p;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getApellido() {
		return apellido;
	}

	public void setApellido(String apellido) {
		this.apellido = apellido;
	}
	
	public String getClave() {
		return clave;
	}

	public void setClave(String clave) {
		this.clave = clave;
	}
	
	public int getDni() {
		return dni;
	}

	public void setDni(int dni) {
		this.dni = dni;
	}
	
	public short getGenero() {
		return genero;
	}

	public void setGenero(short genero) {
		this.genero = genero;
	}
	
	public int getTelefono() {
		return telefono;
	}

	public void setTelefono(int telefono) {
		this.telefono = telefono;
	}
	
	public String getDomicilio() {
		return domicilio;
	}

	public void setDomicilio(String domicilio) {
		this.domicilio = domicilio;
	}
	
	public Date getNacimiento() {
		return nacimiento;
	}

	public void setNacimiento(Date nacimiento) {
		this.nacimiento = nacimiento;
	}

	@Override
	public String toString() {
		return "Usuario [legajo=" + legajo_p + ", nombre=" + nombre + ", apellido=" + apellido + ", dni=" + dni + "]";
	}
}
