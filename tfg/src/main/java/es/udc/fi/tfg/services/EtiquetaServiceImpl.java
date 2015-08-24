package es.udc.fi.tfg.services;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import es.udc.fi.tfg.daos.ActivoDAO;
import es.udc.fi.tfg.daos.EstandarDAO;
import es.udc.fi.tfg.daos.EtiquetaDAO;
import es.udc.fi.tfg.daos.ParametroDAO;
import es.udc.fi.tfg.daos.TecnologiaDAO;
import es.udc.fi.tfg.model.Activo;
import es.udc.fi.tfg.model.Estandar;
import es.udc.fi.tfg.model.Etiqueta;
import es.udc.fi.tfg.model.Parametro;
import es.udc.fi.tfg.model.Tecnologia;

@Service
public class EtiquetaServiceImpl implements EtiquetaService {
	
	static Logger log= Logger.getLogger("tfg");
	
	@Autowired
	private EtiquetaDAO etiquetaDAO;
	
	@Autowired
	private ActivoDAO activoDAO;
	
	@Autowired 
	private EstandarDAO estandarDAO;
	
	@Autowired 
	private TecnologiaDAO tecnologiaDAO;
	
	@Autowired 
	private ParametroDAO parametroDAO;

	@Override
	@Transactional(value="miTransactionManager")
	public void crearEtiqueta(Etiqueta miEtiqueta) {
		try{
			etiquetaDAO.create(miEtiqueta);
			log.info("Creando la etiqueta: "+miEtiqueta.toString());
		}catch(DataAccessException e){
			log.error("Error al crear la etiqueta: "+miEtiqueta.toString());
		}
		
	}

	@Override
	@Transactional(value="miTransactionManager")
	public void modificarEtiqueta(Etiqueta miEtiqueta) {
		try{
			etiquetaDAO.update(miEtiqueta);
			log.info("Actualizando la etiqueta: "+miEtiqueta.toString());
		}catch(DataAccessException e){
			log.error("Error al actualizar la etiqueta: "+miEtiqueta.toString());
		}
		
	}

	@Override
	@Transactional(value="miTransactionManager")
	public void borrarEtiqueta(Etiqueta miEtiqueta) {
		try{
			etiquetaDAO.remove(miEtiqueta);
			log.info("Borrando la etiqueta: "+miEtiqueta.toString());
		}catch(DataAccessException e){
			log.error("Error al borrar la etiqueta: "+miEtiqueta.toString());
		}
		
	}

	@Override
	@Transactional(value="miTransactionManager")
	public List<Etiqueta> buscarEtiquetas() {
		List<Etiqueta> etiquetas=null;
		try{
			etiquetas=etiquetaDAO.findAll();
			log.info("Buscando etiquetas");
		}catch(DataAccessException e){
			log.error("Error al buscar etiquetas");
		}
		return etiquetas;
	}
	
	@Override
	@Transactional(value="miTransactionManager")
	public Etiqueta buscarEtiquetaPorId(Long id){
		Etiqueta etiqueta=null;
		try{
			etiqueta=etiquetaDAO.findById(id);
			log.info("Buscando etiqueta con id: "+id);
		}catch (DataAccessException e){
			log.info("Error al buscar la etiqueta con id: "+id);
		}
		return etiqueta;
	}
	

	@Override
	@Transactional(value="miTransactionManager")
	public void crearEstandar(Estandar miEstandar) {
		try{
			estandarDAO.create(miEstandar);
			log.info("Creando el estandar: "+miEstandar.toString());
		}catch(DataAccessException e){
			log.error("Error al crear el estandar: "+miEstandar.toString());
		}
		
	}

	@Override
	@Transactional(value="miTransactionManager")
	public void borrarEstandar(Estandar miEstandar) {
		try{
			estandarDAO.remove(miEstandar);
			log.info("Borrando el estandar: "+miEstandar.toString());
		}catch(DataAccessException e){
			log.error("Error al borrar el estandar: "+miEstandar.toString());
		}
		
	}

	@Override
	@Transactional(value="miTransactionManager")
	public void crearParametro(Parametro miParametro) {
		try{
			parametroDAO.create(miParametro);
			log.info("Creando el parametro: "+miParametro.toString());
		}catch(DataAccessException e){
			log.error("Error al crear el parametro: "+miParametro.toString());
		}
		
	}

	@Override
	@Transactional(value="miTransactionManager")
	public void borrarParametro(Parametro miParametro) {
		try{
			parametroDAO.remove(miParametro);
			log.info("Borrando el parametro: "+miParametro.toString());
		}catch(DataAccessException e){
			log.error("Error al borrar el parametro: "+miParametro.toString());
		}
		
	}

	@Override
	@Transactional(value="miTransactionManager")
	public void crearTecnologia(Tecnologia miTecnologia) {
		try{
			tecnologiaDAO.create(miTecnologia);
			log.info("Creando la tecnologia: "+miTecnologia.toString());
		}catch(DataAccessException e){
			log.error("Error al crear la tecnologia: "+miTecnologia.toString());
		}
		
	}

	@Override
	@Transactional(value="miTransactionManager")
	public void borrarTecnologia(Tecnologia miTecnologia) {
		try{
			tecnologiaDAO.remove(miTecnologia);
			log.info("Borrando la tecnologia: "+miTecnologia.toString());
		}catch(DataAccessException e){
			log.error("Error al borrar la tecnologia: "+miTecnologia.toString());
		}
		
	}

	@Override
	@Transactional(value="miTransactionManager")
	public List<Etiqueta> buscarEtiquetasLibres() {
		List<Etiqueta> etiquetas= null;
		List<Activo> activos=null;
		List<Etiqueta> etiquetasLibres=new ArrayList<Etiqueta>();
		Boolean etiquetaLibre;
		try{
			etiquetas=etiquetaDAO.findAll();
			activos=activoDAO.findAll();
			for(Etiqueta etiqueta:etiquetas){
				etiquetaLibre=true;
				for(Activo activo:activos){
					if(activo.getEtiqueta().getIdEtiqueta()==etiqueta.getIdEtiqueta()){
						etiquetaLibre=false;
						break;
					}
				}
				if(etiquetaLibre){
					etiquetasLibres.add(etiqueta);
				}
			}
			log.info("Buscando etiquetas libres");
		}catch(DataAccessException e){
			log.error("Error al buscar etiquetas libres");
		}
		
		return etiquetasLibres;
	}

	@Override
	@Transactional(value="miTransactionManager")
	public List<Estandar> buscarEstandars() {
		List<Estandar> estandars=null;
		try{
			estandars=estandarDAO.findAll();
			log.info("Buscando estandares");
		}catch (DataAccessException e){
			log.error("Error al buscar estandares");
		}
		
		return estandars;
	}

	@Override
	@Transactional(value="miTransactionManager")
	public List<Parametro> buscarParametros() {
		List<Parametro> parametros=null;
		
		try{
			parametros=parametroDAO.findAll();
			log.info("Buscando parametros");
		}catch (DataAccessException e){
			log.error("Error al buscar parametros");
		}
		
		return parametros;
	}

	@Override
	@Transactional(value="miTransactionManager")
	public List<Tecnologia> buscarTecnologias() {
		List<Tecnologia> tecnologias=null;
		
		try{
			tecnologias=tecnologiaDAO.findAll();
			log.info("Buscando tecnologias");
		}catch (DataAccessException e){
			log.error("Error al buscar tecnologias");
		}
		
		return tecnologias;
	}

}
