package es.udc.fi.tfg.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;


@Entity
@Table(name="Estandar")
public class Estandar {
	
	private Long idEstandar;
	private String nombre;
	
	@SuppressWarnings("unused")
	private Estandar(){
	}
	
	public Estandar(Long idEstandar, String nombre) {
		super();
		this.idEstandar = idEstandar;
		this.nombre = nombre;
	}
	
	
	@Id
	@SequenceGenerator(name="idEstandar",sequenceName="estandar_idestandar_seq")
	@GeneratedValue(strategy=GenerationType.SEQUENCE,generator="idEstandar")
	public Long getIdEstandar() {
		return idEstandar;
	}
	public void setIdEstandar(Long idEstandar) {
		this.idEstandar = idEstandar;
	}
	
	@Column(name="nombre",nullable=false)
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
