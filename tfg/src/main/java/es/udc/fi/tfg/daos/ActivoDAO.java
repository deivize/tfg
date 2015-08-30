package es.udc.fi.tfg.daos;

import java.util.List;

import es.udc.fi.tfg.dtos.ActivoLocalizacionDto;
import es.udc.fi.tfg.model.Activo;
import es.udc.fi.tfg.model.Localizacion;

public interface ActivoDAO {
	
	Long create(Activo activo);
	List<Activo> findByName(String nombre);
	List<Activo> findAll();
	Activo findById(Long id);
	List<Localizacion> getLocalizacionesActivo(Long id);
	Localizacion getLocalizacionActual(Long id);
	List<ActivoLocalizacionDto> getLocalizacionesActuales();
	void update(Activo activo);
	void remove(Activo activo);
	

}
