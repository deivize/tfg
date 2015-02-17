package es.udc.fi.tfg.services;

import java.util.List;

import es.udc.fi.tfg.model.Activo;

public interface ActivoService {

	void crearActivo(Activo miActivo);
	void modificarActivo(Activo miActivo);
	void borrarActivo(Activo miActivo);
	Activo buscarActivoPorId(Long id);
	List<Activo> buscarActivos();
	
}
