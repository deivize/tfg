package es.udc.fi.tfg.services;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import es.udc.fi.tfg.daos.LocalizacionDAO;
import es.udc.fi.tfg.model.Localizacion;

@Service
public class LocalizacionServiceImpl implements LocalizacionService {
	
	static Logger log= Logger.getLogger("tfg");
	
	@Autowired
	LocalizacionDAO localizacionDAO;
	
	@Override
	public void crearLocalizacion(Localizacion miLocalizacion) {
		try{
			localizacionDAO.create(miLocalizacion);
			log.info("Creando la localizacion: "+miLocalizacion.toString());
		}catch(DataAccessException e){
			log.error("Error al crear la localizacion: "+miLocalizacion.toString());
		}
		
	}

	@Override
	public void borrarLocalizacion(Localizacion miLocalizacion) {
		try{
			localizacionDAO.remove(miLocalizacion);
			log.info("Borrando la localizacion: "+miLocalizacion.toString());
		}catch(DataAccessException e){
			log.error("Error al borrar la localizacion: "+miLocalizacion.toString());
		}
		
	}
	

}
