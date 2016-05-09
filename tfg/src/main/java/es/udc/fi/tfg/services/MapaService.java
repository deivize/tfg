package es.udc.fi.tfg.services;

import es.udc.fi.tfg.model.Mapa;

public interface MapaService {
	
	void crearMapa(Mapa mapa);
	void actualizarMapa(Mapa mapa);
	void borrarMapa(Mapa mapa);
	Mapa buscarMapaActivo();
	Mapa buscarMapaPorNombre(String nombre);

}
