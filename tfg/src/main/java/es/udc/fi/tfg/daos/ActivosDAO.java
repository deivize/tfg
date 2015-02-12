package es.udc.fi.tfg.daos;

import java.util.List;

import es.udc.fi.tfg.model.Activo;

public interface ActivosDAO {
	
	Long create(Activo activo);
	List<Activo> findByName(String nombre);
	List<Activo> findAll();
	void update(Activo activo);
	void remove(Activo activo);
	

}
