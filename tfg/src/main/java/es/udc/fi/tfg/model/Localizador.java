package es.udc.fi.tfg.model;


import java.util.List;

public class Localizador {

	private Long idLocalizador;
	private String modelo;
	private String tipo;
	private List<Localizacion> ubicacion;
	private List<Etiqueta> etiquetas;
	
	
	
	public Long getIdLocalizador() {
		return idLocalizador;
	}
	public void setIdLocalizador(Long idLocalizador) {
		this.idLocalizador = idLocalizador;
	}
	public String getModelo() {
		return modelo;
	}
	public void setModelo(String modelo) {
		this.modelo = modelo;
	}
	public String getTipo() {
		return tipo;
	}
	public void setTipo(String tipo) {
		this.tipo = tipo;
	}
	public List<Localizacion> getUbicacion() {
		return ubicacion;
	}
	public void setUbicacion(List<Localizacion> ubicacion) {
		this.ubicacion = ubicacion;
	}
	public List<Etiqueta> getEtiquetas() {
		return etiquetas;
	}
	public void setEtiquetas(List<Etiqueta> etiquetas) {
		this.etiquetas = etiquetas;
	}
	
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((etiquetas == null) ? 0 : etiquetas.hashCode());
		result = prime * result
				+ ((idLocalizador == null) ? 0 : idLocalizador.hashCode());
		result = prime * result + ((modelo == null) ? 0 : modelo.hashCode());
		result = prime * result + ((tipo == null) ? 0 : tipo.hashCode());
		result = prime * result
				+ ((ubicacion == null) ? 0 : ubicacion.hashCode());
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
		Localizador other = (Localizador) obj;
		if (etiquetas == null) {
			if (other.etiquetas != null)
				return false;
		} else if (!etiquetas.equals(other.etiquetas))
			return false;
		if (idLocalizador == null) {
			if (other.idLocalizador != null)
				return false;
		} else if (!idLocalizador.equals(other.idLocalizador))
			return false;
		if (modelo == null) {
			if (other.modelo != null)
				return false;
		} else if (!modelo.equals(other.modelo))
			return false;
		if (tipo == null) {
			if (other.tipo != null)
				return false;
		} else if (!tipo.equals(other.tipo))
			return false;
		if (ubicacion == null) {
			if (other.ubicacion != null)
				return false;
		} else if (!ubicacion.equals(other.ubicacion))
			return false;
		return true;
	}
	
	
	@Override
	public String toString() {
		return "Localizador [idLocalizador=" + idLocalizador + ", modelo="
				+ modelo + ", tipo=" + tipo + ", ubicacion=" + ubicacion
				+ ", etiquetas=" + etiquetas + "]";
	}
	
	
	
	
}
