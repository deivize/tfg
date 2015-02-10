package es.udc.fi.tfg.model;

public class Tecnologia {
	
	private Long idTecnologia;
	private String tipo;
	private String subtipo;

	
	
	
	public Long getIdTecnologia() {
		return idTecnologia;
	}
	public void setIdTecnologia(Long idTecnologia) {
		this.idTecnologia = idTecnologia;
	}
	public String getTipo() {
		return tipo;
	}
	public void setTipo(String tipo) {
		this.tipo = tipo;
	}
	public String getSubtipo() {
		return subtipo;
	}
	public void setSubtipo(String subtipo) {
		this.subtipo = subtipo;
	}
	
	
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((idTecnologia == null) ? 0 : idTecnologia.hashCode());
		result = prime * result + ((subtipo == null) ? 0 : subtipo.hashCode());
		result = prime * result + ((tipo == null) ? 0 : tipo.hashCode());
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
		Tecnologia other = (Tecnologia) obj;
		if (idTecnologia == null) {
			if (other.idTecnologia != null)
				return false;
		} else if (!idTecnologia.equals(other.idTecnologia))
			return false;
		if (subtipo == null) {
			if (other.subtipo != null)
				return false;
		} else if (!subtipo.equals(other.subtipo))
			return false;
		if (tipo == null) {
			if (other.tipo != null)
				return false;
		} else if (!tipo.equals(other.tipo))
			return false;
		return true;
	}
	
	
	@Override
	public String toString() {
		return "Tecnologia [idTecnologia=" + idTecnologia + ", tipo=" + tipo
				+ ", subtipo=" + subtipo + "]";
	}
	
	
	
	
	
	

}
