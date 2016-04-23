package es.udc.fi.tfg.daos;

import java.util.List;

import es.udc.fi.tfg.model.LocalizacionInteres;

public interface LocalizacionInteresDAO {
	
	Long create(LocalizacionInteres locInteres);
	List<LocalizacionInteres> findAll();
	List<LocalizacionInteres> findByTipo(String tipo);
	void update(LocalizacionInteres locInteres);
	void remove(LocalizacionInteres locInteres);

}
