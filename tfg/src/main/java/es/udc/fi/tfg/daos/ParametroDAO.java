package es.udc.fi.tfg.daos;

import java.util.List;

import es.udc.fi.tfg.model.Parametro;

public interface ParametroDAO {
	
	Long create(Parametro parametro);
	void remove(Parametro parametro);
	List<Parametro> findAll();
	Parametro findById(Long id);
}
