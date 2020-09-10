package entidad;

public class Notas {

	private short estado;
	private short parcial1;
	private short parcial2;
	private short recu1;
	private short recu2;

	
	public Notas()
	{}

	public Notas(short estado, short parcial1, short parcial2, short recu1, short recu2) {
		this.estado = estado;
		this.parcial1 = parcial1;
		this.parcial2 = parcial2;
		this.recu1 = recu1;
		this.recu2 = recu2;
	}


	public short getEstado() {
		return estado;
	}

	public void setEstado(short estado) {
		this.estado = estado;
	}
	
	public short getParcial1() {
		return parcial1;
	}

	public void setParcial1(short parcial1) {
		this.parcial1 = parcial1;
	}
	
	public short getParcial2() {
		return parcial2;
	}

	public void setParcial2(short parcial2) {
		this.parcial2 = parcial2;
	}
	
	public short getRecu1() {
		return recu1;
	}

	public void setRecu1(short recu1) {
		this.recu1 = recu1;
	}
	
	public short getRecu2() {
		return recu2;
	}

	public void setRecu2(short recu2) {
		this.recu2 = recu2;
	}
	
}
