package es.udc.fi.tfg.model;

import java.sql.Timestamp;
import java.util.ArrayList;
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
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;

@Entity
@Table(name="Localizacion")
public class Localizacion {
	
	private Long idLocalizacion;
	private Long coord_x;
	private Long coord_y;
	private Long coord_z;
	private String edificio;
	private Long planta;
	private String area;
	private String zona;
	private Timestamp fecha;
	private List<ActivoLocalizacion> activos= new ArrayList<ActivoLocalizacion>();
	private List<LectorLocalizacion> lectores= new ArrayList<LectorLocalizacion>();
	
	@SuppressWarnings("unused")
	private Localizacion(){
	}
	
	
	
	public Localizacion(Long coord_x, Long coord_y,
			Long coord_z, String edificio, Long planta, String area,
			String zona, Timestamp fecha) {
		super();
		this.coord_x = coord_x;
		this.coord_y = coord_y;
		this.coord_z = coord_z;
		this.edificio = edificio;
		this.planta = planta;
		this.area = area;
		this.zona = zona;
		this.fecha = fecha;
	}


	@Id
	@SequenceGenerator(name="idLocalizacion",sequenceName="localizacion_idlocalizacion_seq")
	@GeneratedValue(strategy=GenerationType.SEQUENCE,generator="idLocalizacion")
	@Column(name="idLocalizacion",nullable=false)
	public Long getIdLocalizacion() {
		return idLocalizacion;
	}
	public void setIdLocalizacion(Long idLocalizacion) {
		this.idLocalizacion = idLocalizacion;
	}
	
	@Column(name="coord_x",nullable=false)
	public Long getCoord_x() {
		return coord_x;
	}
	public void setCoord_x(Long coord_x) {
		this.coord_x = coord_x;
	}
	
	@Column(name="coord_y",nullable=false)
	public Long getCoord_y() {
		return coord_y;
	}
	public void setCoord_y(Long coord_y) {
		this.coord_y = coord_y;
	}
	
	@Column(name="coord_z",nullable=false)
	public Long getCoord_z() {
		return coord_z;
	}
	public void setCoord_z(Long coord_z) {
		this.coord_z = coord_z;
	}
	
	@Column(name="edificio",nullable=false)
	public String getEdificio() {
		return edificio;
	}
	public void setEdificio(String edificio) {
		this.edificio = edificio;
	}
	
	@Column(name="planta",nullable=false)
	public Long getPlanta() {
		return planta;
	}
	public void setPlanta(Long planta) {
		this.planta = planta;
	}
	
	@Column(name="area",nullable=true)
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	
	@Column(name="zona",nullable=true)
	public String getZona() {
		return zona;
	}
	public void setZona(String zona) {
		this.zona = zona;
	}
	
	@Column(name="fecha",nullable=false)
	public Timestamp getFecha() {
		return fecha;
	}
	public void setFecha(Timestamp fecha) {
		this.fecha = fecha;
	}
	
	
	@OneToMany(mappedBy="pkAL.localizacion",fetch=FetchType.EAGER)
	@Cascade({CascadeType.SAVE_UPDATE,CascadeType.DELETE})
	public List<ActivoLocalizacion> getActivos() {
		return activos;
	}
	
	public void setActivos(List<ActivoLocalizacion> activos) {
		this.activos = activos;
	}
	
	@OneToMany(mappedBy="pkLL.localizacion",fetch=FetchType.EAGER)
	@Cascade({CascadeType.SAVE_UPDATE,CascadeType.DELETE})
	public List<LectorLocalizacion> getLectores() {
		return lectores;
	}
	
	public void setLectores(List<LectorLocalizacion> lectores) {
		this.lectores = lectores;
	}



	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((activos == null) ? 0 : activos.hashCode());
		result = prime * result + ((area == null) ? 0 : area.hashCode());
		result = prime * result + ((coord_x == null) ? 0 : coord_x.hashCode());
		result = prime * result + ((coord_y == null) ? 0 : coord_y.hashCode());
		result = prime * result + ((coord_z == null) ? 0 : coord_z.hashCode());
		result = prime * result
				+ ((edificio == null) ? 0 : edificio.hashCode());
		result = prime * result + ((fecha == null) ? 0 : fecha.hashCode());
		result = prime * result
				+ ((idLocalizacion == null) ? 0 : idLocalizacion.hashCode());
		result = prime * result + ((planta == null) ? 0 : planta.hashCode());
		result = prime * result + ((zona == null) ? 0 : zona.hashCode());
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
		Localizacion other = (Localizacion) obj;
		if (activos == null) {
			if (other.activos != null)
				return false;
		} else if (!activos.equals(other.activos))
			return false;
		if (area == null) {
			if (other.area != null)
				return false;
		} else if (!area.equals(other.area))
			return false;
		if (coord_x == null) {
			if (other.coord_x != null)
				return false;
		} else if (!coord_x.equals(other.coord_x))
			return false;
		if (coord_y == null) {
			if (other.coord_y != null)
				return false;
		} else if (!coord_y.equals(other.coord_y))
			return false;
		if (coord_z == null) {
			if (other.coord_z != null)
				return false;
		} else if (!coord_z.equals(other.coord_z))
			return false;
		if (edificio == null) {
			if (other.edificio != null)
				return false;
		} else if (!edificio.equals(other.edificio))
			return false;
		if (fecha == null) {
			if (other.fecha != null)
				return false;
		} else if (!fecha.equals(other.fecha))
			return false;
		if (idLocalizacion == null) {
			if (other.idLocalizacion != null)
				return false;
		} else if (!idLocalizacion.equals(other.idLocalizacion))
			return false;
		if (planta == null) {
			if (other.planta != null)
				return false;
		} else if (!planta.equals(other.planta))
			return false;
		if (zona == null) {
			if (other.zona != null)
				return false;
		} else if (!zona.equals(other.zona))
			return false;
		return true;
	}
	
	
	@Override
	public String toString() {
		return "Localizacion [idLocalizacion=" + idLocalizacion + ", coord_x="
				+ coord_x + ", coord_y=" + coord_y + ", coord_z=" + coord_z
				+ ", edificio=" + edificio + ", planta=" + planta + ", area="
				+ area + ", zona=" + zona + ", fecha=" + fecha + "]";
	}
	
	
	
	
	

}
