package es.udc.fi.tfg.daos;

import java.util.List;

import es.udc.fi.tfg.model.Localizacion;

public interface LocalizacionDAO {
	
	Long create(Localizacion localizacion);
	List<Localizacion> findAll();
	List<Localizacion> findByEdificio(String edificio);
	Localizacion findById(Long id);
	void update(Localizacion edificio);
	void remove(Localizacion edificio);
}
