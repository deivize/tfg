package es.udc.fi.tfg.model;

import javax.persistence.Embeddable;
import javax.persistence.ManyToOne;


@Embeddable
public class LectorLocalizacionId implements java.io.Serializable{
	
	
	private static final long serialVersionUID = -5177491823551943094L;
	private Lector lector;
	private Localizacion localizacion;
	
	
	@ManyToOne
	public Lector getLector() {
		return lector;
	}
	public void setLector(Lector lector) {
		this.lector = lector;
	}
	@ManyToOne
	public Localizacion getLocalizacion() {
		return localizacion;
	}
	public void setLocalizacion(Localizacion localizacion) {
		this.localizacion = localizacion;
	}
	
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((lector == null) ? 0 : lector.hashCode());
		result = prime * result
				+ ((localizacion == null) ? 0 : localizacion.hashCode());
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
		LectorLocalizacionId other = (LectorLocalizacionId) obj;
		if (lector == null) {
			if (other.lector != null)
				return false;
		} else if (!lector.equals(other.lector))
			return false;
		if (localizacion == null) {
			if (other.localizacion != null)
				return false;
		} else if (!localizacion.equals(other.localizacion))
			return false;
		return true;
	}
	
	
	
	
	
	
	
	

}
