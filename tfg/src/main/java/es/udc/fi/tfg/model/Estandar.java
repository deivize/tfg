package es.udc.fi.tfg.model;

public class Estandar {
	
	private Long idEstandar;
	private String nombre;
	
	
	
	public Long getIdEstandar() {
		return idEstandar;
	}
	public void setIdEstandar(Long idEstandar) {
		this.idEstandar = idEstandar;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((idEstandar == null) ? 0 : idEstandar.hashCode());
		result = prime * result + ((nombre == null) ? 0 : nombre.hashCode());
		return result;
	}
	
	
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Estandar other = (Estandar) obj;
		if (idEstandar == null) {
			if (other.idEstandar != null)
				return false;
		} else if (!idEstandar.equals(other.idEstandar))
			return false;
		if (nombre == null) {
			if (other.nombre != null)
				return false;
		} else if (!nombre.equals(other.nombre))
			return false;
		return true;
	}
	
	
	@Override
	public String toString() {
		return "Estandar [idEstandar=" + idEstandar + ", nombre=" + nombre
				+ "]";
	}
	
	
	
	

}
