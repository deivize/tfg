package es.udc.fi.tfg.model;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Arrays;
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
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;

@Entity
@Table(name="Activo")
public class Activo {

	private Long idActivo;
	private String nombre;
	private byte[] icono;
	private String categoria;
	private Etiqueta etiqueta;
	private Timestamp fechaCaducidad;
	private Double temperatura;
	private Mapa mapa;
	private List<ActivoLocalizacion> ubicacion= new ArrayList<ActivoLocalizacion>();
	
	@SuppressWarnings("unused")
	private Activo(){
	}
	
	public Activo(String nombre, byte[] icono, String categoria,
			Etiqueta etiqueta) {
		super();
		this.nombre = nombre;
		this.icono = icono;
		this.categoria = categoria;
		this.etiqueta = etiqueta;
	}
	
	@Id
	@SequenceGenerator(name="idActivo",sequenceName="activo_idactivo_seq")
	@GeneratedValue(strategy=GenerationType.SEQUENCE,generator="idActivo")
	@Column(name="idActivo",nullable=false)
	public Long getIdActivo() {
		return idActivo;
	}
	public void setIdActivo(Long idActivo) {
		this.idActivo = idActivo;
	}
	
	@Column(name="nombre",nullable=false)
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	
	@Column(name="icono",nullable=true)
	public byte[] getIcono() {
		return icono;
	}
	public void setIcono(byte[] icono) {
		this.icono = icono;
	}
	
	@Column(name="categoria",nullable=true)
	public String getCategoria() {
		return categoria;
	}
	public void setCategoria(String categoria) {
		this.categoria = categoria;
	}
	
	@Column(name="fechaCaducidad",nullable=true)
	public Timestamp getFechaCaducidad() {
		return fechaCaducidad;
	}

	public void setFechaCaducidad(Timestamp fechaCaducidad) {
		this.fechaCaducidad = fechaCaducidad;
	}

	@Column(name="temperatura",nullable=true)
	public Double getTemperatura() {
		return temperatura;
	}

	public void setTemperatura(Double temperatura) {
		this.temperatura = temperatura;
	}

	@OneToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="idEtiqueta")
	@Cascade({CascadeType.SAVE_UPDATE})
	public Etiqueta getEtiqueta() {
		return etiqueta;
	}
	public void setEtiqueta(Etiqueta etiqueta) {
		this.etiqueta = etiqueta;
	}
	
	@OneToMany(mappedBy="pkAL.activo",fetch=FetchType.EAGER)
	@Cascade({CascadeType.SAVE_UPDATE,CascadeType.DELETE})
	public List<ActivoLocalizacion> getUbicacion() {
		return ubicacion;
	}
	public void setUbicacion(List<ActivoLocalizacion> ubicacion) {
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
				+ ((categoria == null) ? 0 : categoria.hashCode());
		result = prime * result
				+ ((etiqueta == null) ? 0 : etiqueta.hashCode());
		result = prime * result
				+ ((fechaCaducidad == null) ? 0 : fechaCaducidad.hashCode());
		result = prime * result + Arrays.hashCode(icono);
		result = prime * result
				+ ((idActivo == null) ? 0 : idActivo.hashCode());
		result = prime * result + ((mapa == null) ? 0 : mapa.hashCode());
		result = prime * result + ((nombre == null) ? 0 : nombre.hashCode());
		result = prime * result
				+ ((temperatura == null) ? 0 : temperatura.hashCode());
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
		Activo other = (Activo) obj;
		if (categoria == null) {
			if (other.categoria != null)
				return false;
		} else if (!categoria.equals(other.categoria))
			return false;
		if (etiqueta == null) {
			if (other.etiqueta != null)
				return false;
		} else if (!etiqueta.equals(other.etiqueta))
			return false;
		if (fechaCaducidad == null) {
			if (other.fechaCaducidad != null)
				return false;
		} else if (!fechaCaducidad.equals(other.fechaCaducidad))
			return false;
		if (!Arrays.equals(icono, other.icono))
			return false;
		if (idActivo == null) {
			if (other.idActivo != null)
				return false;
		} else if (!idActivo.equals(other.idActivo))
			return false;
		if (mapa == null) {
			if (other.mapa != null)
				return false;
		} else if (!mapa.equals(other.mapa))
			return false;
		if (nombre == null) {
			if (other.nombre != null)
				return false;
		} else if (!nombre.equals(other.nombre))
			return false;
		if (temperatura == null) {
			if (other.temperatura != null)
				return false;
		} else if (!temperatura.equals(other.temperatura))
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
		return "Activo [idActivo=" + idActivo + ", nombre=" + nombre
				+ ", icono=" + Arrays.toString(icono) + ", categoria="
				+ categoria + ", etiqueta=" + etiqueta + ", ubicacion="
				+ ubicacion + "]";
	}
	
	
	
	
	
	
}
