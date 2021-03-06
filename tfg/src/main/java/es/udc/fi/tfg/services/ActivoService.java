package es.udc.fi.tfg.services;

import java.sql.Timestamp;
import java.util.List;

import es.udc.fi.tfg.dtos.ActivoAlertaDto;
import es.udc.fi.tfg.dtos.ActivoLocalizacionDto;
import es.udc.fi.tfg.dtos.TrazadoDto;
import es.udc.fi.tfg.model.Activo;
import es.udc.fi.tfg.model.Localizacion;
import es.udc.fi.tfg.model.Mapa;

public interface ActivoService {

	void crearActivo(Activo miActivo);
	void modificarActivo(Activo miActivo);
	void borrarActivo(Activo miActivo);
	Activo buscarActivoPorId(Long id);
	List<Localizacion> getLocalizacines(Long id);
	List<Activo> buscarActivos();
	List<Activo> buscarActivosMapa();
	Localizacion getLocalizacionActual(Long id);
	List<ActivoLocalizacionDto> getLocalizacionesActuales();
	List<ActivoAlertaDto> getActivosAlerta();
	String crearPdf(Long id);
	List<Activo> buscarActivosConsulta(String nombre, String categoria,Timestamp fecha);
	List<TrazadoDto> buscarTrazados(Timestamp fechaDesde,Timestamp fechaHasta);
		
	
}
