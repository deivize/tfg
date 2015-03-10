package es.udc.fi.tfg.services;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import es.udc.fi.tfg.daos.LectorDAO;
import es.udc.fi.tfg.model.Lector;

@Service
public class LectorSerciveImpl implements LectorService {

	static Logger log= Logger.getLogger("tfg");
	
	@Autowired
	private LectorDAO lectorDAO;
	
	@Override
	@Transactional(value="miTransactionManager")
	public void crearLector(Lector miLector) {
		try{
			lectorDAO.create(miLector);
			log.info("Creando el Lector: "+miLector.toString());
		}catch(DataAccessException e){
			log.error("Error al crear el lector: "+miLector.toString());
		}
		
	}

	@Override
	@Transactional(value="miTransactionManager")
	public void modificarLector(Lector miLector) {
		try{
			lectorDAO.update(miLector);
			log.info("Actualizando el Lector: "+miLector.toString());
		}catch(DataAccessException e){
			log.error("Error al actualizar el lector: "+miLector.toString());
		}
		
	}

	@Override
	@Transactional(value="miTransactionManager")
	public void borrarLector(Lector miLector) {
		try{
			lectorDAO.remove(miLector);
			log.info("Borrando el Lector: "+miLector.toString());
		}catch(DataAccessException e){
			log.error("Error al borrar el lector: "+miLector.toString());
		}
		
	}

	@Override
	@Transactional(value="miTransactionManager")
	public List<Lector> buscarLectores() {
		List<Lector> lectores=null;
		try{
			lectores=lectorDAO.findAll();
			log.info("Buscando lectores");
		}catch(DataAccessException e){
			log.info("Error al buscar lectores");
		}
		return lectores;
	}
	
	@Override
	@Transactional(value="miTransactionManager")
	public Lector buscarLectorPorId(Long id){
		Lector lector=null;
		try{
			lector=lectorDAO.findById(id);
			log.info("Buscando lector con id: "+id);
		}catch(DataAccessException e){
			log.info("Error al buscar el lector con id: "+id);
		}
		return lector;
		
	}
	

}
