package es.udc.fi.tfg.services;

import java.util.List;

import es.udc.fi.tfg.dtos.ActivoLocalizacionDto;
import es.udc.fi.tfg.model.Activo;
import es.udc.fi.tfg.model.Localizacion;

public interface ActivoService {

	void crearActivo(Activo miActivo);
	void modificarActivo(Activo miActivo);
	void borrarActivo(Activo miActivo);
	Activo buscarActivoPorId(Long id);
	List<Localizacion> getLocalizacines(Long id);
	List<Activo> buscarActivos();
	Localizacion getLocalizacionActual(Long id);
	List<ActivoLocalizacionDto> getLocalizacionesActuales();
}
