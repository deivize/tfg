package es.udc.fi.tfg.daos;

import java.sql.Timestamp;
import java.util.List;

import es.udc.fi.tfg.dtos.ActivoAlertaDto;
import es.udc.fi.tfg.dtos.ActivoLocalizacionDto;
import es.udc.fi.tfg.model.Activo;
import es.udc.fi.tfg.model.Localizacion;

public interface ActivoDAO {
	
	Long create(Activo activo);
	List<Activo> findByName(String nombre);
	List<Activo> findAll();
	List<Activo> findActivosMapa();
	Activo findById(Long id);
	List<Localizacion> getLocalizacionesActivo(Long id);
	Localizacion getLocalizacionActual(Long id);
	List<ActivoLocalizacionDto> getLocalizacionesActuales();
	List<ActivoAlertaDto> getActivosAlerta();
	List<Activo> buscarActivos(String nombre, String categoria, Timestamp fecha);
	void update(Activo activo);
	void remove(Activo activo);
	

}
