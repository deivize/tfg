package es.udc.fi.tfg.model;

import javax.persistence.Embeddable;
import javax.persistence.ManyToOne;


@Embeddable
public class EtiquetaLectorId implements java.io.Serializable {

	private static final long serialVersionUID = 8635086262992868784L;
	private Etiqueta etiqueta;
	private Lector lector;
	
	@ManyToOne
	public Etiqueta getEtiqueta() {
		return etiqueta;
	}
	public void setEtiqueta(Etiqueta etiqueta) {
		this.etiqueta = etiqueta;
	}
	
	@ManyToOne
	public Lector getLector() {
		return lector;
	}
	public void setLector(Lector lector) {
		this.lector = lector;
	}
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((etiqueta == null) ? 0 : etiqueta.hashCode());
		result = prime * result + ((lector == null) ? 0 : lector.hashCode());
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
		EtiquetaLectorId other = (EtiquetaLectorId) obj;
		if (etiqueta == null) {
			if (other.etiqueta != null)
				return false;
		} else if (!etiqueta.equals(other.etiqueta))
			return false;
		if (lector == null) {
			if (other.lector != null)
				return false;
		} else if (!lector.equals(other.lector))
			return false;
		return true;
	}
	
	
	
	
	
}
