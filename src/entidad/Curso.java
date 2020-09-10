package entidad;

public class Curso {

	private short id_curso;
	private short id_materia;
	private String materia;
	private short periodo;
	private short cuatrimestre;
	private int legajo_p;
	private String nombre_p;
	private String apellido_p;
	
	public Curso()
	{}

	public Curso(short id_curso, short id_materia) {
		this.id_curso = id_curso;
		this.id_materia = id_materia;
	}

	public int getIdCurso() {
		return id_curso;
	}
	
	public void setIdCurso(short id_curso) {
		this.id_curso = id_curso;
	}

	public short getIdMateria() {
		return id_materia;
	}
	
	public void setIdMateria(short id_materia) {
		this.id_materia = id_materia;
	}	

	public String getMateria() {
		return materia;
	}	
	
	public void setMateria(String materia) {
		this.materia = materia;
	}
	
	public short getPeriodo() {
		return periodo;
	}
	
	public void setPeriodo(short periodo) {
		this.periodo = periodo;
	}

	public short getCuatrimestre() {
		return cuatrimestre;
	}
	
	public void setCuatrimestre(short cuatrimestre) {
		this.cuatrimestre = cuatrimestre;
	}

	public int getLegajoP() {
		return legajo_p;
	}

	public void setLegajoP(int legajo_p) {
		this.legajo_p = legajo_p;
	}
	
	public String getNombreP() {
		return nombre_p;
	}	
	
	public void setNombreP(String nombre_p) {
		this.nombre_p = nombre_p;
	}
	
	public String getApellidoP() {
		return apellido_p;
	}	
	
	public void setApellidoP(String apellido_p) {
		this.apellido_p = apellido_p;
	}
	
	@Override
	public String toString() {
		return "Curso [id=" + id_curso + ", materia=" + materia + ", profesor=" + legajo_p + "]";
	}
}
