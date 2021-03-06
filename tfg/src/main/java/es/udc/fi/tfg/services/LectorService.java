package es.udc.fi.tfg.services;

import java.util.List;

import es.udc.fi.tfg.dtos.LectorDto;
import es.udc.fi.tfg.model.Lector;

public interface LectorService {
	
	void crearLector(Lector miLector);
	void modificarLector(Lector miLector);
	void borrarLector(Lector miLector);
	List<Lector> buscarLectores();
	List<Lector> buscarLectoresMapa();
	Lector buscarLectorPorId(Long id);
	List<Lector> buscarLectoresConsulta(String tipo, String modelo);
	List<LectorDto> lectorToLectorDto();
	String crearPdf(String tipo, String modelo);

}
