package es.udc.fi.tfg.model;


import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;

@Entity
@Table(name="Lector")
public class Lector {

	private Long idLector;
	private String modelo;
	private String tipo;
	private Mapa mapa;
	private List<EtiquetaLector> etiquetas= new ArrayList<EtiquetaLector>();
	private List<LectorLocalizacion> ubicacion= new ArrayList<LectorLocalizacion>();
	
	@SuppressWarnings("unused")
	private Lector(){
	}
	
	
	public Lector(String modelo, String tipo) {
		super();
		this.modelo = modelo;
		this.tipo = tipo;
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
	
	@OneToMany(mappedBy="pkEL.lector",fetch=FetchType.EAGER)
	@Cascade({CascadeType.SAVE_UPDATE,CascadeType.DELETE})
	public List<EtiquetaLector> getEtiquetas() {
		return etiquetas;
	}
	public void setEtiquetas(List<EtiquetaLector> etiquetas) {
		this.etiquetas = etiquetas;
	}
	
	@OneToMany(mappedBy="pkLL.lector",fetch=FetchType.EAGER)
	@Cascade({CascadeType.SAVE_UPDATE,CascadeType.DELETE})
	public List<LectorLocalizacion> getUbicacion() {
		return ubicacion;
	}


	public void setUbicacion(List<LectorLocalizacion> ubicacion) {
		this.ubicacion = ubicacion;
	}

	
	@ManyToOne
	@JoinColumn(name="idMapa")
	public Mapa getMapa() {
		return mapa;
	}


	public void setMapa(Mapa mapa) {
		this.mapa = mapa;
	}


	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((etiquetas == null) ? 0 : etiquetas.hashCode());
		result = prime * result
				+ ((idLector == null) ? 0 : idLector.hashCode());
		result = prime * result + ((mapa == null) ? 0 : mapa.hashCode());
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
		if (mapa == null) {
			if (other.mapa != null)
				return false;
		} else if (!mapa.equals(other.mapa))
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
		return "Lector [idLector=" + idLector + ", modelo=" + modelo
				+ ", tipo=" + tipo + "]";
	}
	
	
	
	
}
