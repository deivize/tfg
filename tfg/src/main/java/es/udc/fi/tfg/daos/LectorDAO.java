package es.udc.fi.tfg.daos;

import java.util.List;

import es.udc.fi.tfg.model.Lector;

public interface LectorDAO {

	Long create(Lector lector);
	List<Lector> findAll();
	void update(Lector lector);
	void remove(Lector lector);
	
}
