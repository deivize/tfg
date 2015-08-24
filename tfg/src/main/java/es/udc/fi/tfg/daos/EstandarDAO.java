package es.udc.fi.tfg.daos;

import java.util.List;

import es.udc.fi.tfg.model.Estandar;

public interface EstandarDAO {

	Long create(Estandar estandar);
	void remove(Estandar estandar);
	List<Estandar> findAll();
}
