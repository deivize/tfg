package es.udc.fi.tfg.daos;

import java.util.List;

import es.udc.fi.tfg.model.Lector;
import es.udc.fi.tfg.model.LectorLocalizacion;

public interface LectorDAO {

	Long create(Lector lector);
	List<Lector> findAll();
	List<Lector> findLectoresMapa();
	Lector findById(Long id);
	List<Lector> buscarLectores(String tipo, String modelo);
	void update(Lector lector);
	void remove(Lector lector);
	
}
