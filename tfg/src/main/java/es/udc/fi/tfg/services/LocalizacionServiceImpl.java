package es.udc.fi.tfg.services;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import es.udc.fi.tfg.daos.LocalizacionDAO;
import es.udc.fi.tfg.model.Localizacion;

@Service
public class LocalizacionServiceImpl implements LocalizacionService {
	
	static Logger log= Logger.getLogger("tfg");
	
	@Autowired
	private LocalizacionDAO localizacionDAO;
	
	
	@Override
	@Transactional(value="miTransactionManager")
	public void crearLocalizacion(Localizacion miLocalizacion) {
		try{
			localizacionDAO.create(miLocalizacion);
			log.info("Creando la localizacion: "+miLocalizacion.toString());
		}catch(DataAccessException e){
			log.error("Error al crear la localizacion: "+miLocalizacion.toString());
		}
		
	}

	@Override
	@Transactional(value="miTransactionManager")
	public void borrarLocalizacion(Localizacion miLocalizacion) {
		try{
			localizacionDAO.remove(miLocalizacion);
			log.info("Borrando la localizacion: "+miLocalizacion.toString());
		}catch(DataAccessException e){
			log.error("Error al borrar la localizacion: "+miLocalizacion.toString());
		}
		
	}

	@Override
	@Transactional(value="miTransactionManager")
	public Localizacion buscarLocalizacionPorId(Long idLocalizacion) {
		
		Localizacion loc=null;
		try{
			loc=localizacionDAO.findById(idLocalizacion);
			log.info("Buscando localizacion con id: "+idLocalizacion);
		}catch(DataAccessException e){
			log.error("Error al buscar localizacion con id: "+idLocalizacion);
		}
		
		return loc;
	}
	

}
