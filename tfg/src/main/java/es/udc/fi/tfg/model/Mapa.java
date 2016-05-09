package es.udc.fi.tfg.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name="Mapa")
public class Mapa {

	private Long idMapa;
	private String nombre;
	private Boolean activo;
	
	@Id
	@SequenceGenerator(name="idMapa",sequenceName="mapa_idmapa_seq")
	@GeneratedValue(strategy=GenerationType.SEQUENCE,generator="idMapa")
	@Column(name="idMapa",nullable=false)
	public Long getIdMapa() {
		return idMapa;
	}
	public void setIdMapa(Long idMapa) {
		this.idMapa = idMapa;
	}
	
	@Column(name="nombre",nullable=false)
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	@Column(name="activo",nullable=false)
	public Boolean getActivo() {
		return activo;
	}
	public void setActivo(Boolean activo) {
		this.activo = activo;
	}
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((idMapa == null) ? 0 : idMapa.hashCode());
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
		Mapa other = (Mapa) obj;
		if (idMapa == null) {
			if (other.idMapa != null)
				return false;
		} else if (!idMapa.equals(other.idMapa))
			return false;
		if (nombre == null) {
			if (other.nombre != null)
				return false;
		} else if (!nombre.equals(other.nombre))
			return false;
		return true;
	}
	
	
	
	
	
}
