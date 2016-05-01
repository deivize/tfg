package es.udc.fi.tfg.services;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import es.udc.fi.tfg.daos.LectorLocalizacionDAO;
import es.udc.fi.tfg.model.LectorLocalizacion;

@Service
public class LectorLocalizacionServiceImpl implements LectorLocalizacionService {

	
	static Logger log= Logger.getLogger("tfg");
	
	@Autowired
	private LectorLocalizacionDAO lectLocDAO;
	
	@Override
	@Transactional(value="miTransactionManager")
	public void crearLectorLocalizacion(LectorLocalizacion lectLoc) {
		try{
			lectLocDAO.create(lectLoc);
			log.info("Creando lectorLocalizacion");
		}catch(DataAccessException e){
			log.error("Error al crear lectorLocalizacion");
		}
		
	}

}
