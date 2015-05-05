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
@Table(name="etiquetalector")
@AssociationOverrides({
	@AssociationOverride(name="pkEL.lector",joinColumns= @JoinColumn(name="idlector")),
	@AssociationOverride(name="pkEL.etiqueta",joinColumns= @JoinColumn(name="idetiqueta"))
})
public class EtiquetaLector {
	
	private EtiquetaLectorId pkEL= new EtiquetaLectorId();
	private Timestamp fecha=new Timestamp(Calendar.getInstance().getTimeInMillis());
	
	public EtiquetaLector(){
	}
	
	@EmbeddedId
	public EtiquetaLectorId getPkEL() {
		return pkEL;
	}
	public void setPkEL(EtiquetaLectorId pk) {
		this.pkEL = pk;
	}
	
	@Transient
	public Etiqueta getEtiqueta(){
		return pkEL.getEtiqueta();
	}
	
	public void setEtiqueta(Etiqueta etiqueta){
		getPkEL().setEtiqueta(etiqueta);
	}
	
	@Transient
	public Lector getLector(){
		return pkEL.getLector();
	}
	
	public void setLector(Lector lector){
		getPkEL().setLector(lector);
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
		result = prime * result + ((pkEL == null) ? 0 : pkEL.hashCode());
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
		EtiquetaLector other = (EtiquetaLector) obj;
		if (fecha == null) {
			if (other.fecha != null)
				return false;
		} else if (!fecha.equals(other.fecha))
			return false;
		if (pkEL == null) {
			if (other.pkEL != null)
				return false;
		} else if (!pkEL.equals(other.pkEL))
			return false;
		return true;
	}
	
	
	
	

}
