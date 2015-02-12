package es.udc.fi.tfg.model;

import java.util.Arrays;
import java.util.List;

public class Activo {

	private Long idActivo;
	private String nombre;
	private byte[] icono;
	private String categoria;
	private Etiqueta etiqueta;
	private List<Localizacion> ubicacion;
	
	
	public Long getIdActivo() {
		return idActivo;
	}
	public void setIdActivo(Long idActivo) {
		this.idActivo = idActivo;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public byte[] getIcono() {
		return icono;
	}
	public void setIcono(byte[] icono) {
		this.icono = icono;
	}
	public String getCategoria() {
		return categoria;
	}
	public void setCategoria(String categoria) {
		this.categoria = categoria;
	}
	public Etiqueta getEtiqueta() {
		return etiqueta;
	}
	public void setEtiqueta(Etiqueta etiqueta) {
		this.etiqueta = etiqueta;
	}
	
	public List<Localizacion> getUbicacion() {
		return ubicacion;
	}
	public void setUbicacion(List<Localizacion> ubicacion) {
		this.ubicacion = ubicacion;
	}
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((categoria == null) ? 0 : categoria.hashCode());
		result = prime * result
				+ ((etiqueta == null) ? 0 : etiqueta.hashCode());
		result = prime * result + Arrays.hashCode(icono);
		result = prime * result
				+ ((idActivo == null) ? 0 : idActivo.hashCode());
		result = prime * result + ((nombre == null) ? 0 : nombre.hashCode());
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
		Activo other = (Activo) obj;
		if (categoria == null) {
			if (other.categoria != null)
				return false;
		} else if (!categoria.equals(other.categoria))
			return false;
		if (etiqueta == null) {
			if (other.etiqueta != null)
				return false;
		} else if (!etiqueta.equals(other.etiqueta))
			return false;
		if (!Arrays.equals(icono, other.icono))
			return false;
		if (idActivo == null) {
			if (other.idActivo != null)
				return false;
		} else if (!idActivo.equals(other.idActivo))
			return false;
		if (nombre == null) {
			if (other.nombre != null)
				return false;
		} else if (!nombre.equals(other.nombre))
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
		return "Activos [idActivo=" + idActivo + ", nombre=" + nombre
				+ ", icono=" + Arrays.toString(icono) + ", categoria="
				+ categoria + ", etiqueta=" + etiqueta + ", ubicacion="
				+ ubicacion + "]";
	}
	
	
	
	
	
	
}
