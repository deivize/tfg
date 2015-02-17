package es.udc.fi.tfg.model;


import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name="Lector")
public class Lector {

	private Long idLector;
	private String modelo;
	private String tipo;
	private Localizacion ubicacion;
	private List<Etiqueta> etiquetas;
	
	@SuppressWarnings("unused")
	private Lector(){
	}
	
	
	public Lector(String modelo, String tipo,
			Localizacion ubicacion) {
		super();
		this.modelo = modelo;
		this.tipo = tipo;
		this.ubicacion = ubicacion;
	}
	
	
	@Id
	@SequenceGenerator(name="idLector",sequenceName="lector_idlector_seq")
	@GeneratedValue(strategy=GenerationType.SEQUENCE,generator="idLector")
	@Column(name="idLector",nullable=false)
	public Long getIdLector() {
		return idLector;
	}
	public void setIdLector(Long idLocalizador) {
		this.idLector = idLocalizador;
	}
	
	@Column(name="modelo",nullable=false)
	public String getModelo() {
		return modelo;
	}
	public void setModelo(String modelo) {
		this.modelo = modelo;
	}
	
	@Column(name="tipo",nullable=true)
	public String getTipo() {
		return tipo;
	}
	public void setTipo(String tipo) {
		this.tipo = tipo;
	}
	
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="idLocalizacion")
	public Localizacion getUbicacion() {
		return ubicacion;
	}
	public void setUbicacion(Localizacion ubicacion) {
		this.ubicacion = ubicacion;
	}
	
	@ManyToMany(fetch=FetchType.LAZY)
	@JoinTable(
			name="Etiqueta_Lector",
			joinColumns={@JoinColumn(name="idLector")},
			inverseJoinColumns={@JoinColumn(name="idEtiqueta")}				
		)
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
				+ ((idLector == null) ? 0 : idLector.hashCode());
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
		Lector other = (Lector) obj;
		if (etiquetas == null) {
			if (other.etiquetas != null)
				return false;
		} else if (!etiquetas.equals(other.etiquetas))
			return false;
		if (idLector == null) {
			if (other.idLector != null)
				return false;
		} else if (!idLector.equals(other.idLector))
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
		return "Localizador [idLocalizador=" + idLector + ", modelo="
				+ modelo + ", tipo=" + tipo + ", ubicacion=" + ubicacion
				+ ", etiquetas=" + etiquetas + "]";
	}
	
	
	
	
}
