package es.udc.fi.tfg.daos;

import es.udc.fi.tfg.model.Mapa;

public interface MapaDAO {

	Long create(Mapa mapa);
	void update(Mapa mapa);
	void remove(Mapa mapa);
	Mapa getMapaActivo();
	Mapa getMapaByNombre(String nombre);
	
}
