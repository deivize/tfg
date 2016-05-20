package es.udc.fi.tfg.daos;

import java.util.List;

import es.udc.fi.tfg.model.Localizacion;

public interface LocalizacionDAO {
	
	Long create(Localizacion localizacion);
	List<Localizacion> findAll();
	List<Localizacion> findByEdificio(String edificio);
	Localizacion findById(Long id);
	List<Localizacion> findByFiltro(String edificio,Long planta,String area,String zona);
	void update(Localizacion edificio);
	void remove(Localizacion edificio);
}
