package es.udc.fi.tfg.daos;

import java.util.List;

import es.udc.fi.tfg.model.Lector;

public interface LectorDAO {

	Long create(Lector lector);
	List<Lector> findAll();
	Lector findById(Long id);
	List<Lector> buscarLectores(String tipo, String modelo);
	void update(Lector lector);
	void remove(Lector lector);
	
}
