package es.udc.fi.tfg.services;

import es.udc.fi.tfg.model.LectorLocalizacion;

public interface LectorLocalizacionService {
	
	void crearLectorLocalizacion(LectorLocalizacion lectLoc);
	LectorLocalizacion buscarPorIdLector(Long idLector);

}
