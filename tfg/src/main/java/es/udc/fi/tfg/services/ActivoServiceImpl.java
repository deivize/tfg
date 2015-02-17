package es.udc.fi.tfg.services;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import es.udc.fi.tfg.daos.ActivoDAO;
import es.udc.fi.tfg.model.Activo;

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
		// TODO Auto-generated method stub
		return null;
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
	

}
