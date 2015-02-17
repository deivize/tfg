package es.udc.fi.tfg.daos;

import java.util.List;

import es.udc.fi.tfg.model.Activo;

public interface ActivoDAO {
	
	Long create(Activo activo);
	List<Activo> findByName(String nombre);
	List<Activo> findAll();
	Activo findById(Long id);
	void update(Activo activo);
	void remove(Activo activo);
	

}
