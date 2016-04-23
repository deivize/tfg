package es.udc.fi.tfg.dtos;

import java.sql.Timestamp;

public class ActivoAlertaDto {

	private String nombre;
	private String categoria;
	private Timestamp fechaCaducidad;
	private double coord_x;
	private double coord_y;
	private double coord_z;
	
	
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getCategoria() {
		return categoria;
	}
	public void setCategoria(String categoria) {
		this.categoria = categoria;
	}
	public Timestamp getFechaCaducidad() {
		return fechaCaducidad;
	}
	public void setFechaCaducidad(Timestamp fechaCaducidad) {
		this.fechaCaducidad = fechaCaducidad;
	}
	public double getCoord_x() {
		return coord_x;
	}
	public void setCoord_x(double coord_x) {
		this.coord_x = coord_x;
	}
	public double getCoord_y() {
		return coord_y;
	}
	public void setCoord_y(double coord_y) {
		this.coord_y = coord_y;
	}
	public double getCoord_z() {
		return coord_z;
	}
	public void setCoord_z(double coord_z) {
		this.coord_z = coord_z;
	}
	
	
	
	
}
