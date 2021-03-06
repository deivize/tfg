package es.udc.fi.tfg.services;

import java.io.FileOutputStream;
import java.util.Calendar;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

import es.udc.fi.tfg.daos.LocalizacionInteresDAO;
import es.udc.fi.tfg.model.Activo;
import es.udc.fi.tfg.model.Localizacion;
import es.udc.fi.tfg.model.LocalizacionInteres;

@Service
public class LocalizacionInteresServiceImpl implements LocalizacionInteresService {
	
	static Logger log= Logger.getLogger("tfg");
	
	@Autowired
	private LocalizacionInteresDAO locInteresDAO;

	@Override
	@Transactional(value="miTransactionManager")
	public void crearLocInteres(LocalizacionInteres locInteres) {
		try{
			locInteresDAO.create(locInteres);
			log.info("Creando la localizacion de interes: "+locInteres.toString());
		}catch(DataAccessException e){
			log.error("Error al crear la localizacion de interes: "+locInteres.toString());
		}
		
	}

	@Override
	@Transactional(value="miTransactionManager")
	public void modificarLocInteres(LocalizacionInteres locInteres) {
		try{
			locInteresDAO.update(locInteres);
			log.info("Actualizando la localizacion de interes: "+locInteres.toString());
		}catch(DataAccessException e){
			log.error("Error al actualizar la localizacion de interes: "+locInteres.toString());
		}
		
	}

	@Override
	@Transactional(value="miTransactionManager")
	public void borrarLocInteres(LocalizacionInteres locInteres) {
		try{
			locInteresDAO.remove(locInteres);
			log.info("Borrando la localizacion de interes: "+locInteres.toString());
		}catch(DataAccessException e){
			log.error("Error al borrar la localizacion de interes: "+locInteres.toString());
		}
		
	}

	@Override
	@Transactional(value="miTransactionManager")
	public List<LocalizacionInteres> buscarLocsInteres() {
		List<LocalizacionInteres> locsInteres = null;
		try{
			locsInteres= locInteresDAO.findAll();
			log.info("Buscando localizaciones de interes");
		}catch(DataAccessException e){
			log.error("Error buscando localizaciones de interes");
		}
		return locsInteres;
	}

	@Override
	@Transactional(value="miTransactionManager")
	public List<LocalizacionInteres> buscarPorTipo(String tipo) {
		List<LocalizacionInteres> locsInteres = null;
		
		try{
			locsInteres= locInteresDAO.findByTipo(tipo);
			log.info("Buscando localizaciones de interes con tipo "+tipo);
		}catch(DataAccessException e){
			log.error("Error buscando localizaciones de interes con tipo "+tipo);
		}
		return locsInteres;
		
	}

}
