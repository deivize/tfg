package es.udc.fi.tfg.services;

import java.util.List;

import es.udc.fi.tfg.model.Localizacion;

public interface LocalizacionService {
	
	void crearLocalizacion(Localizacion miLocalizacion);
	void borrarLocalizacion(Localizacion miLocalizacion);
	Localizacion buscarLocalizacionPorId(Long idLocalizacion);
	List<Localizacion> buscarPorFiltro(String edificio, Long planta,String area, String zona);
	String crearPdf(String edificio,Long planta,String area,String zona);
}
