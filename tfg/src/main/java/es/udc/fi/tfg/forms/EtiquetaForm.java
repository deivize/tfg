package es.udc.fi.tfg.forms;

public class EtiquetaForm {
	
	private Long parametro;
	
	private Long tecnologia;
	
	private Long estandar;
	
	private String contenido;
	
	private String fabricante;
	
	private Boolean infoCifrada;

	public Long getParametro() {
		return parametro;
	}

	public void setParametro(Long parametro) {
		this.parametro = parametro;
	}

	public Long getTecnologia() {
		return tecnologia;
	}

	public void setTecnologia(Long tecnologia) {
		this.tecnologia = tecnologia;
	}

	public Long getEstandar() {
		return estandar;
	}

	public void setEstandar(Long estandar) {
		this.estandar = estandar;
	}

	public String getContenido() {
		return contenido;
	}

	public void setContenido(String contenido) {
		this.contenido = contenido;
	}

	public String getFabricante() {
		return fabricante;
	}

	public void setFabricante(String fabricante) {
		this.fabricante = fabricante;
	}

	public Boolean getInfoCifrada() {
		return infoCifrada;
	}

	public void setInfoCifrada(Boolean infoCifrada) {
		this.infoCifrada = infoCifrada;
	}

}
