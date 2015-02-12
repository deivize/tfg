package es.udc.fi.tfg.daos;

import es.udc.fi.tfg.model.Estandar;

public interface EstandarDAO {

	Long create(Estandar estandar);
	void remove(Estandar estandar);
}
