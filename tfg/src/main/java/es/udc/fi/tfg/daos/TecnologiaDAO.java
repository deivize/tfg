package es.udc.fi.tfg.daos;

import java.util.List;

import es.udc.fi.tfg.model.Tecnologia;

public interface TecnologiaDAO {
	
	Long create(Tecnologia tecnologia);
	void remove(Tecnologia tecnologia);
	List<Tecnologia> findAll();
	Tecnologia findById(Long id);
}
