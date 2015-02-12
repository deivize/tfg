package es.udc.fi.tfg.daos;

import es.udc.fi.tfg.model.Tecnologia;

public interface TecnologiaDAO {
	
	Long create(Tecnologia tecnologia);
	void remove(Tecnologia tecnologia);
}
