package es.udc.fi.tfg.services;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import es.udc.fi.tfg.daos.MapaDAO;
import es.udc.fi.tfg.model.Mapa;

@Service
public class MapaServiceImpl implements MapaService {

	static Logger log= Logger.getLogger("tfg");
	
	@Autowired
	private MapaDAO mapaDAO;
	
	@Override
	@Transactional(value="miTransactionManager")
	public void crearMapa(Mapa mapa) {
		
		try{
			mapaDAO.create(mapa);
			log.info("Creando mapa: "+mapa.toString());
		}catch(DataAccessException e){
			log.error("Error al crear mapa: "+mapa.toString());
		}
		
	}

	@Override
	@Transactional(value="miTransactionManager")
	public void actualizarMapa(Mapa mapa) {
		try{
			mapaDAO.update(mapa);
			log.info("Actualizando mapa: "+mapa.toString());
		}catch(DataAccessException e){
			log.error("Error al actualizar mapa: "+mapa.toString());
		}
		
	}

	@Override
	@Transactional(value="miTransactionManager")
	public void borrarMapa(Mapa mapa) {
		try{
			mapaDAO.remove(mapa);
			log.info("Borrando mapa: "+mapa.toString());
		}catch(DataAccessException e){
			log.error("Error al borrar mapa: "+mapa.toString());
		}
		
	}

	@Override
	@Transactional(value="miTransactionManager")
	public Mapa buscarMapaActivo() {
		
		Mapa mapa=null;
		
		try{
			mapa=mapaDAO.getMapaActivo();
			log.info("Buscando mapa activo");
		}catch(DataAccessException e){
			log.error("Error al buscar mapa activo");
		}
		
		return mapa;
	}

	@Override
	@Transactional(value="miTransactionManager")
	public Mapa buscarMapaPorNombre(String nombre) {
		Mapa mapa=null;
		
		try{
			mapa=mapaDAO.getMapaByNombre(nombre);
			log.info("Buscando mapa con nombre: "+nombre);
		}catch(DataAccessException e){
			log.error("Error buscando mapa con nombre: "+nombre);
		}
		
		return mapa;
	}

}
