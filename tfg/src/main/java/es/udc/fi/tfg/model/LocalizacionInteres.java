package es.udc.fi.tfg.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;

@Entity
@Table(name="LocalizacionInteres")
public class LocalizacionInteres {
	
	private Long idLocInteres;
	private String tipo;
	private Long width;
	private Long height;
	private String texto;
	private Localizacion localizacion;
	
	
	@SuppressWarnings("unused")
	private LocalizacionInteres(){
	}
	
	
	
	public LocalizacionInteres(Long idLocInteres, String tipo, Long width,
			Long height, String texto, Localizacion localizacion) {
		super();
		this.idLocInteres = idLocInteres;
		this.tipo = tipo;
		this.width = width;
		this.height = height;
		this.texto = texto;
		this.localizacion = localizacion;
	}


	@Id
	@SequenceGenerator(name="idLocInteres",sequenceName="localizacioninteres_idlocinteres_seq")
	@GeneratedValue(strategy=GenerationType.SEQUENCE,generator="idLocInteres")
	@Column(name="idLocInteres",nullable=false)
	public Long getIdLocInteres() {
		return idLocInteres;
	}
	
	public void setIdLocInteres(Long idLocInteres) {
		this.idLocInteres = idLocInteres;
	}
	@Column(name="tipo",nullable=true)
	public String getTipo() {
		return tipo;
	}
	public void setTipo(String tipo) {
		this.tipo = tipo;
	}
	@Column(name="width",nullable=true)
	public Long getWidth() {
		return width;
	}
	public void setWidth(Long width) {
		this.width = width;
	}
	@Column(name="height",nullable=true)
	public Long getHeight() {
		return height;
	}
	public void setHeight(Long height) {
		this.height = height;
	}
	@Column(name="texto",nullable=true)
	public String getTexto() {
		return texto;
	}
	public void setTexto(String texto) {
		this.texto = texto;
	}
	
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="idLocalizacion")
	@Cascade({CascadeType.SAVE_UPDATE})
	public Localizacion getLocalizacion() {
		return localizacion;
	}
	public void setLocalizacion(Localizacion localizacion) {
		this.localizacion = localizacion;
	}



	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((height == null) ? 0 : height.hashCode());
		result = prime * result
				+ ((idLocInteres == null) ? 0 : idLocInteres.hashCode());
		result = prime * result
				+ ((localizacion == null) ? 0 : localizacion.hashCode());
		result = prime * result + ((texto == null) ? 0 : texto.hashCode());
		result = prime * result + ((tipo == null) ? 0 : tipo.hashCode());
		result = prime * result + ((width == null) ? 0 : width.hashCode());
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
		LocalizacionInteres other = (LocalizacionInteres) obj;
		if (height == null) {
			if (other.height != null)
				return false;
		} else if (!height.equals(other.height))
			return false;
		if (idLocInteres == null) {
			if (other.idLocInteres != null)
				return false;
		} else if (!idLocInteres.equals(other.idLocInteres))
			return false;
		if (localizacion == null) {
			if (other.localizacion != null)
				return false;
		} else if (!localizacion.equals(other.localizacion))
			return false;
		if (texto == null) {
			if (other.texto != null)
				return false;
		} else if (!texto.equals(other.texto))
			return false;
		if (tipo == null) {
			if (other.tipo != null)
				return false;
		} else if (!tipo.equals(other.tipo))
			return false;
		if (width == null) {
			if (other.width != null)
				return false;
		} else if (!width.equals(other.width))
			return false;
		return true;
	}
	
	
	
	

}
