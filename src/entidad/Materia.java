package entidad;

public class Materia {

	private short id_materia;
	private String nombre;
	
	public Materia()
	{}
	
	public Materia(short id_materia, String nombre) {
		this.nombre = nombre;
		this.id_materia = id_materia;
	}

	public short getIdMateria() {
		return id_materia;
	}

	public void setIdMateria(short id_materia) {
		this.id_materia = id_materia;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	@Override
	public String toString() {
		return "Usuario [id=" + id_materia + ", nombre=" + nombre + "]";
	}
}
