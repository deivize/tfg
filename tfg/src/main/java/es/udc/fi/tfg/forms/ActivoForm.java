package es.udc.fi.tfg.forms;

import java.util.Date;

public class ActivoForm {
	
	private String nombre;
	private String categoria;
	private Long etiqueta;
	private Date fechaCaducidad;
	
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
	
	public Long getEtiqueta() {
		return etiqueta;
	}
	
	public void setEtiqueta(Long etiqueta) {
		this.etiqueta = etiqueta;
	}

	public Date getFechaCaducidad() {
		return fechaCaducidad;
	}

	public void setFechaCaducidad(Date fechaCaducidad) {
		this.fechaCaducidad = fechaCaducidad;
	}
	
	
	
	

}
