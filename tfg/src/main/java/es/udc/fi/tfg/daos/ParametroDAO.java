package es.udc.fi.tfg.daos;

import es.udc.fi.tfg.model.Parametro;

public interface ParametroDAO {
	
	Long create(Parametro parametro);
	void remove(Parametro parametro);
}
