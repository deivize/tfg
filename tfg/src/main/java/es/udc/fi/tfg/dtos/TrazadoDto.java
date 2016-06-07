package es.udc.fi.tfg.dtos;

import java.util.ArrayList;

import es.udc.fi.tfg.model.Etiqueta;

public class TrazadoDto {
	
	private Long idActivo;
	private Etiqueta etiqueta;
	private String nombre;
	private ArrayList<ArrayList<Double>> coordenadas;
	
	public Long getIdActivo() {
		return idActivo;
	}
	public void setIdActivo(Long idActivo) {
		this.idActivo = idActivo;
	}
	public Etiqueta getEtiqueta() {
		return etiqueta;
	}
	public void setEtiqueta(Etiqueta etiqueta) {
		this.etiqueta = etiqueta;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public ArrayList<ArrayList<Double>> getCoordenadas() {
		return coordenadas;
	}
	public void setCoordenadas(ArrayList<ArrayList<Double>> coordenadas) {
		this.coordenadas = coordenadas;
	}
	

}
