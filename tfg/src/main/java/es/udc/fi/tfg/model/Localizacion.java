package es.udc.fi.tfg.model;

import java.sql.Timestamp;

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
	
	
	public Long getIdLocalizacion() {
		return idLocalizacion;
	}
	public void setIdLocalizacion(Long idLocalizacion) {
		this.idLocalizacion = idLocalizacion;
	}
	public Long getCoord_x() {
		return coord_x;
	}
	public void setCoord_x(Long coord_x) {
		this.coord_x = coord_x;
	}
	public Long getCoord_y() {
		return coord_y;
	}
	public void setCoord_y(Long coord_y) {
		this.coord_y = coord_y;
	}
	public Long getCoord_z() {
		return coord_z;
	}
	public void setCoord_z(Long coord_z) {
		this.coord_z = coord_z;
	}
	public String getEdificio() {
		return edificio;
	}
	public void setEdificio(String edificio) {
		this.edificio = edificio;
	}
	public Long getPlanta() {
		return planta;
	}
	public void setPlanta(Long planta) {
		this.planta = planta;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getZona() {
		return zona;
	}
	public void setZona(String zona) {
		this.zona = zona;
	}
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
