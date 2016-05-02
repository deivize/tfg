package es.udc.fi.tfg.services;

import es.udc.fi.tfg.model.Localizacion;

public interface LocalizacionService {
	
	void crearLocalizacion(Localizacion miLocalizacion);
	void borrarLocalizacion(Localizacion miLocalizacion);
	Localizacion buscarLocalizacionPorId(Long idLocalizacion);

}
