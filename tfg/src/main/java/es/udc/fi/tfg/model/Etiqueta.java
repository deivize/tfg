package es.udc.fi.tfg.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name="Etiqueta")
public class Etiqueta {
	
	private Long etiquetaId;
	private String contenido;
	private String fabricante;
	private Boolean infoCifrada;
	private Tecnologia tecnologia;
	private Estandar estandar;
	private Parametro parametros;
	
	@SuppressWarnings("unused")
	private Etiqueta(){
	}
	
	public Etiqueta(Long etiquetaId, String contenido, String fabricante,
			Boolean infoCifrada, Tecnologia tecnologia, Estandar estandar,
			Parametro parametros) {
		super();
		this.etiquetaId = etiquetaId;
		this.contenido = contenido;
		this.fabricante = fabricante;
		this.infoCifrada = infoCifrada;
		this.tecnologia = tecnologia;
		this.estandar = estandar;
		this.parametros = parametros;
	}
	
	
	@Id
	@SequenceGenerator(name="idEtiqueta",sequenceName="etiqueta_idetiqueta_seq")
	@GeneratedValue(strategy=GenerationType.SEQUENCE,generator="idEtiqueta")
	public Long getEtiquetaId() {
		return etiquetaId;
	}
	public void setEtiquetaId(Long etiquetaId) {
		this.etiquetaId = etiquetaId;
	}
	
	@Column(name="contenido",nullable=false)
	public String getContenido() {
		return contenido;
	}
	public void setContenido(String contenido) {
		this.contenido = contenido;
	}
	
	@Column(name="fabricante",nullable=false)
	public String getFabricante() {
		return fabricante;
	}
	public void setFabricante(String fabricante) {
		this.fabricante = fabricante;
	}
	
	@Column(name="infoCifrada",nullable=false)
	public Boolean getInfoCifrada() {
		return infoCifrada;
	}
	public void setInfoCifrada(Boolean infoCifrada) {
		this.infoCifrada = infoCifrada;
	}
	
	@ManyToOne
	@JoinColumn(name="idTecnologia")
	public Tecnologia getTecnologia() {
		return tecnologia;
	}
	public void setTecnologia(Tecnologia tecnologia) {
		this.tecnologia = tecnologia;
	}
	
	@ManyToOne
	@JoinColumn(name="idEstandar")
	public Estandar getEstandar() {
		return estandar;
	}
	public void setEstandar(Estandar estandar) {
		this.estandar = estandar;
	}
	
	@ManyToOne
	@JoinColumn(name="idParametro")
	public Parametro getParametros() {
		return parametros;
	}
	public void setParametros(Parametro parametros) {
		this.parametros = parametros;
	}
	
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((contenido == null) ? 0 : contenido.hashCode());
		result = prime * result
				+ ((estandar == null) ? 0 : estandar.hashCode());
		result = prime * result
				+ ((etiquetaId == null) ? 0 : etiquetaId.hashCode());
		result = prime * result
				+ ((fabricante == null) ? 0 : fabricante.hashCode());
		result = prime * result
				+ ((infoCifrada == null) ? 0 : infoCifrada.hashCode());
		result = prime * result
				+ ((parametros == null) ? 0 : parametros.hashCode());
		result = prime * result
				+ ((tecnologia == null) ? 0 : tecnologia.hashCode());
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
		Etiqueta other = (Etiqueta) obj;
		if (contenido == null) {
			if (other.contenido != null)
				return false;
		} else if (!contenido.equals(other.contenido))
			return false;
		if (estandar == null) {
			if (other.estandar != null)
				return false;
		} else if (!estandar.equals(other.estandar))
			return false;
		if (etiquetaId == null) {
			if (other.etiquetaId != null)
				return false;
		} else if (!etiquetaId.equals(other.etiquetaId))
			return false;
		if (fabricante == null) {
			if (other.fabricante != null)
				return false;
		} else if (!fabricante.equals(other.fabricante))
			return false;
		if (infoCifrada == null) {
			if (other.infoCifrada != null)
				return false;
		} else if (!infoCifrada.equals(other.infoCifrada))
			return false;
		if (parametros == null) {
			if (other.parametros != null)
				return false;
		} else if (!parametros.equals(other.parametros))
			return false;
		if (tecnologia == null) {
			if (other.tecnologia != null)
				return false;
		} else if (!tecnologia.equals(other.tecnologia))
			return false;
		return true;
	}
	
	
	
	@Override
	public String toString() {
		return "Etiqueta [etiquetaId=" + etiquetaId + ", contenido="
				+ contenido + ", fabricante=" + fabricante + ", infoCifrada="
				+ infoCifrada + ", tecnologia=" + tecnologia + ", estandar="
				+ estandar + ", parametros=" + parametros + "]";
	}
	
	
	
	
	
	
	
	
	

}
