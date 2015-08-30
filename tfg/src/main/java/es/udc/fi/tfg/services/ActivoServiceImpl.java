package es.udc.fi.tfg.services;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import es.udc.fi.tfg.daos.ActivoDAO;
import es.udc.fi.tfg.dtos.ActivoLocalizacionDto;
import es.udc.fi.tfg.model.Activo;
import es.udc.fi.tfg.model.Localizacion;

@Service
public class ActivoServiceImpl implements ActivoService {
	
	
	static Logger log= Logger.getLogger("tfg");
	
	@Autowired
	private ActivoDAO activoDAO;
	
	
	

	@Override
	@Transactional(value="miTransactionManager")
	public void crearActivo(Activo miActivo) {
		try{
			activoDAO.create(miActivo);
			log.info("Creando el activo: "+miActivo.toString());
		}catch(DataAccessException e){
			log.error("Error al crear el activo: "+miActivo.toString());
		}
		
	}

	@Override
	@Transactional(value="miTransactionManager")
	public void modificarActivo(Activo miActivo) {
		try{
			activoDAO.update(miActivo);
			log.info("Actualizando el activo: "+miActivo.toString());
		}catch(DataAccessException e){
			log.error("Error al actualizar el activo: "+miActivo.toString());
		}
		
	}

	@Override
	@Transactional(value="miTransactionManager")
	public void borrarActivo(Activo miActivo) {
		try{
			activoDAO.remove(miActivo);
			log.info("Borrando el activo: "+miActivo.toString());
		}catch(DataAccessException e){
			log.error("Error al borrar el activo: "+miActivo.toString());
		}
		
	}

	@Override
	@Transactional(value="miTransactionManager")
	public Activo buscarActivoPorId(Long id) {
		Activo activo=null;
		try{
			activo=activoDAO.findById(id);
			log.info("Buscando activo con id: "+id);
		}catch(DataAccessException e){
			log.error("Error al buscar activo con id: "+id);
		}
		return activo;
	}
	
	@Override
	@Transactional(value="miTransactionManager")
	public List<Activo> buscarActivos(){
		List<Activo> activos=null;
		try{
			activos=activoDAO.findAll();
			log.info("Buscando activos");
		}catch(DataAccessException e){
			log.error("Error al buscar activos");
		}
		return activos;
		
	}

	@Override
	@Transactional(value="miTransactionManager")
	public List<Localizacion> getLocalizacines(Long id) {
		List<Localizacion> localizaciones = null;
		try{
			localizaciones=activoDAO.getLocalizacionesActivo(id);
			log.info("Buscando localizaciones del activo: "+id);
			
		}catch(DataAccessException e){
			log.error("Error al buscar localizaciones del activo: "+id);
		}
		return localizaciones;
	}

	@Override
	@Transactional(value="miTransactionManager")
	public Localizacion getLocalizacionActual(Long id) {
		Localizacion loc=null;
		
		try{
			loc=activoDAO.getLocalizacionActual(id);
			log.info("Buscando localizacion actual para el activo "+id);
		}catch (DataAccessException e){
			log.error("Error al buscar la localizacion actual del actvio "+id);
		}
		
		return loc;
	}

	@Override
	@Transactional(value="miTransactionManager")
	public List<ActivoLocalizacionDto> getLocalizacionesActuales() {
		
		List<ActivoLocalizacionDto> dtos=null;
		
		try{
			dtos=activoDAO.getLocalizacionesActuales();
			log.info("Buscando localizaciones actuales de todos los activos");
		}catch (DataAccessException e){
			log.error("Error al buscar localizaciones actules de todos los activos");
		}
		
		return dtos;
	}
	

}
