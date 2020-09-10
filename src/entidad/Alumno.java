package entidad;
import java.util.Date;
import entidad.Notas;

public class Alumno {

	private int legajo_a;
	private String nombre;
	private String apellido;
	private int dni;
	private short genero;
	private int telefono;
	private String domicilio;
	private Date nacimiento;
	public Notas notas;
	
	public Alumno()
	{
		this.notas = new Notas();
	}

	public Alumno(int legajo_a, String nombre, String apellido, int dni, short genero, int telefono, String domicilio, Date nacimiento) {
		this.legajo_a = legajo_a;
		this.nombre = nombre;
		this.apellido = apellido;
		this.dni = dni;
		this.genero = genero;
		this.telefono = telefono;
		this.domicilio = domicilio;
		this.nacimiento = nacimiento;
		this.notas = new Notas();
	}

	public int getLegajoA() {
		return legajo_a;
	}

	public void setLegajoA(int legajo_a) {
		this.legajo_a = legajo_a;
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
		return "Alumno [legajo=" + legajo_a + ", nombre=" + nombre + ", apellido=" + apellido + ", dni=" + dni + "]";
	}
}
