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
import javax.persistence.Transient;



@Entity
@Table(name="lector_localizacion")
@AssociationOverrides({
	@AssociationOverride(name="pkLL.lector",joinColumns= @JoinColumn(name="idlector")),
	@AssociationOverride(name="pkLL.localizacion",joinColumns= @JoinColumn(name="idlocalizacion"))
})
public class LectorLocalizacion {

	private LectorLocalizacionId pkLL= new LectorLocalizacionId();
	private Timestamp fecha=new Timestamp(Calendar.getInstance().getTimeInMillis());
	
	public LectorLocalizacion(){
	}

	@EmbeddedId
	public LectorLocalizacionId getPkLL() {
		return pkLL;
	}

	public void setPkLL(LectorLocalizacionId pk) {
		this.pkLL = pk;
	}
	
	@Transient
	public Lector getLector(){
		return pkLL.getLector();
	}
	
	public void setLector(Lector lector){
		getPkLL().setLector(lector);
	}
	
	@Transient
	public Localizacion getLocalizacion(){
		return pkLL.getLocalizacion();
	}
	
	public void setLocalizacion(Localizacion localizacion){
		getPkLL().setLocalizacion(localizacion);
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
		result = prime * result + ((pkLL == null) ? 0 : pkLL.hashCode());
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
		LectorLocalizacion other = (LectorLocalizacion) obj;
		if (fecha == null) {
			if (other.fecha != null)
				return false;
		} else if (!fecha.equals(other.fecha))
			return false;
		if (pkLL == null) {
			if (other.pkLL != null)
				return false;
		} else if (!pkLL.equals(other.pkLL))
			return false;
		return true;
	}
	
	
	
	
	
	
	
}
