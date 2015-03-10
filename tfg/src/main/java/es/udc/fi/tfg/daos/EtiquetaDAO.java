package es.udc.fi.tfg.daos;

import java.util.List;

import es.udc.fi.tfg.model.Etiqueta;

public interface EtiquetaDAO {
	
	Long create(Etiqueta etiqueta);
	List<Etiqueta> findAll();
	Etiqueta findById(Long id);
	void update(Etiqueta etiqueta);
	void remove(Etiqueta etiqueta);
	

}
