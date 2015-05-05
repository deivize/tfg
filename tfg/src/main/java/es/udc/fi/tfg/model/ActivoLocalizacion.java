package es.udc.fi.tfg.model;

import java.sql.Timestamp;
import java.util.Calendar;

import javax.persistence.AssociationOverride;
import javax.persistence.AssociationOverrides;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

@Entity
@Table(name="ActivoLocalizacion")
@AssociationOverrides({
	@AssociationOverride(name="pkAL.activo",joinColumns= @JoinColumn(name="idactivo")),
	@AssociationOverride(name="pkAL.localizacion",joinColumns= @JoinColumn(name="idlocalizacion"))
})
public class ActivoLocalizacion {
	
	private ActivoLocalizacionId pkAL= new ActivoLocalizacionId();
	private Timestamp fecha=new Timestamp(Calendar.getInstance().getTimeInMillis());
	
	public ActivoLocalizacion(){
	}
	
	@EmbeddedId
	public ActivoLocalizacionId getPkAL() {
		return pkAL;
	}

	public void setPkAL(ActivoLocalizacionId pk) {
		this.pkAL = pk;
	}
	
	@Transient
	public Activo getActivo(){
		return getPkAL().getActivo();
	}
	
	public void setActivo(Activo activo){
		getPkAL().setActivo(activo);
	}
	
	@Transient
	public Localizacion getLocalizacion(){
		return getPkAL().getLocalizacion();
	}
	
	public void setLocalizacion(Localizacion localizacion){
		getPkAL().setLocalizacion(localizacion);
	}
	
	
	@Column(name="fecha",nullable=false)
	public Timestamp getFecha() {
		return fecha;
	}

	public void setFecha(Timestamp fecha) {
		this.fecha = fecha;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((fecha == null) ? 0 : fecha.hashCode());
		result = prime * result + ((pkAL == null) ? 0 : pkAL.hashCode());
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
		ActivoLocalizacion other = (ActivoLocalizacion) obj;
		if (fecha == null) {
			if (other.fecha != null)
				return false;
		} else if (!fecha.equals(other.fecha))
			return false;
		if (pkAL == null) {
			if (other.pkAL != null)
				return false;
		} else if (!pkAL.equals(other.pkAL))
			return false;
		return true;
	}
	
	
	

}
