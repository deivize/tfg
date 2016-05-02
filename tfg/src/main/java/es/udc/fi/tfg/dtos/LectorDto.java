package es.udc.fi.tfg.dtos;

import java.util.List;

import es.udc.fi.tfg.model.LectorLocalizacion;

public class LectorDto {

	private String modelo;
	private String tipo;
	private Double coord_x;
	private Double coord_y;
	
	public String getModelo() {
		return modelo;
	}
	public void setModelo(String modelo) {
		this.modelo = modelo;
	}
	public String getTipo() {
		return tipo;
	}
	public void setTipo(String tipo) {
		this.tipo = tipo;
	}
	public Double getCoord_x() {
		return coord_x;
	}
	public void setCoord_x(Double coord_x) {
		this.coord_x = coord_x;
	}
	public Double getCoord_y() {
		return coord_y;
	}
	public void setCoord_y(Double coord_y) {
		this.coord_y = coord_y;
	}
	
	
	
	
	
	
}
