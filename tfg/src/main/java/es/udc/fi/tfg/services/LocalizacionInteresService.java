package es.udc.fi.tfg.services;

import java.util.List;

import es.udc.fi.tfg.model.LocalizacionInteres;

public interface LocalizacionInteresService {
	
	void crearLocInteres(LocalizacionInteres locInteres);
	void modificarLocInteres(LocalizacionInteres locInteres);
	void borrarLocInteres (LocalizacionInteres locInteres);
	List<LocalizacionInteres> buscarLocsInteres();
	List<LocalizacionInteres> buscarPorTipo(String tipo);

}
