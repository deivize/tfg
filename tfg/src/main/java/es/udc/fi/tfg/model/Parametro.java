package es.udc.fi.tfg.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name="Parametro")
public class Parametro {
	
	private Long idParametro;
	private String nombre;
	private String valor;
	
	@SuppressWarnings("unused")
	private Parametro(){
	}
	
	public Parametro(String nombre, String valor) {
		super();
		this.nombre = nombre;
		this.valor = valor;
	}
	
	
	@Id
	@SequenceGenerator(name="idParametro",sequenceName="parametro_idparametro_seq")
	@GeneratedValue(strategy=GenerationType.SEQUENCE,generator="idParametro")
	@Column(name="idParametro",nullable=false)
	public Long getIdParametro() {
		return idParametro;
	}
	public void setIdParametro(Long idParametros) {
		this.idParametro = idParametros;
	}
	
	@Column(name="nombre",nullable=false)
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	
	@Column(name="valor",nullable=false)
	public String getValor() {
		return valor;
	}
	public void setValor(String valor) {
		this.valor = valor;
	}
	
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((idParametro == null) ? 0 : idParametro.hashCode());
		result = prime * result + ((nombre == null) ? 0 : nombre.hashCode());
		result = prime * result + ((valor == null) ? 0 : valor.hashCode());
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
		Parametro other = (Parametro) obj;
		if (idParametro == null) {
			if (other.idParametro != null)
				return false;
		} else if (!idParametro.equals(other.idParametro))
			return false;
		if (nombre == null) {
			if (other.nombre != null)
				return false;
		} else if (!nombre.equals(other.nombre))
			return false;
		if (valor == null) {
			if (other.valor != null)
				return false;
		} else if (!valor.equals(other.valor))
			return false;
		return true;
	}
	
	
	@Override
	public String toString() {
		return "Parametros [idParametros=" + idParametro + ", nombre="
				+ nombre + ", valor=" + valor + "]";
	}
	
	
	
	
	

}
