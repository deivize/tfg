package es.udc.fi.tfg.services;

import java.io.FileOutputStream;
import java.util.ArrayList;
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

import es.udc.fi.tfg.daos.LectorDAO;
import es.udc.fi.tfg.dtos.LectorDto;
import es.udc.fi.tfg.model.Activo;
import es.udc.fi.tfg.model.Lector;
import es.udc.fi.tfg.model.LectorLocalizacion;
import es.udc.fi.tfg.model.Localizacion;

@Service
public class LectorSerciveImpl implements LectorService {

	static Logger log= Logger.getLogger("tfg");
	
	@Autowired
	private LectorDAO lectorDAO;
	
	@Autowired
	private LocalizacionService localizacionService;
	
	@Autowired
	private LectorLocalizacionService lectLocService;
	
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
			log.info("Buscando lectores");
			lectores=lectorDAO.findAll();
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

	@Override
	@Transactional(value="miTransactionManager")
	public List<Lector> buscarLectoresConsulta(String tipo, String modelo) {
		
		List<Lector> lectores=null;
		
		try{
			if(tipo.equals("")){
				tipo=null;
			}
			if(modelo.equals("")){
				modelo=null;
			}
			lectores=lectorDAO.buscarLectores(tipo,modelo);
			log.info("Buscando lectores con parametros "+tipo+" "+modelo);
		}catch(DataAccessException e){
			log.error("Error al buscar lectores");
		}
		
		return lectores;
	}
	
	@Override
	@Transactional(value="miTransactionManager")
	public String crearPdf(String tipo, String modelo) {
		
		List<Lector> lectores=null;
		String pdfName="";
		
		if(tipo.equals("")){
			tipo=null;
		}
		if(modelo.equals("")){
			modelo=null;
		}
		
		try{
			lectores=lectorDAO.buscarLectores(tipo,modelo);
			log.info("Buscando lectores con con tipo "+tipo+" y modelo "+modelo);
			
		}catch(DataAccessException e){
			log.error("Error al buscar lectores con tipo "+tipo+" y modelo "+modelo);
			
		}
		
		
		
		//Crear el pdf
		Document document= new Document();
		
		try{
			Calendar cal= Calendar.getInstance();
			pdfName=""+cal.get(Calendar.DAY_OF_MONTH)+""+cal.get(Calendar.MONTH)+""
			+cal.get(Calendar.YEAR)+""+cal.get(Calendar.HOUR_OF_DAY)+""+cal.get(Calendar.MINUTE)+""+cal.get(Calendar.SECOND);
			
			PdfWriter writer = PdfWriter.getInstance(document, 
					new FileOutputStream("C:\\Users\\David\\git\\tfg\\src\\main\\webapp\\resources\\pdfs\\"+pdfName+".pdf"));
			document.open();
			
			PdfPTable table_lectores=new PdfPTable(2);
			table_lectores.setWidthPercentage(100);
			table_lectores.setSpacingBefore(10f);
			table_lectores.setSpacingAfter(10f);
			
			float[] columnWidths_lectores = {1f, 1f};
			table_lectores.setWidths(columnWidths_lectores);
			
			PdfPCell cabecera1=new PdfPCell(new Paragraph("Tipo lector"));
			cabecera1.setPaddingLeft(10);
			cabecera1.setHorizontalAlignment(Element.ALIGN_CENTER);
			cabecera1.setVerticalAlignment(Element.ALIGN_MIDDLE);
			
			
			PdfPCell cabecera2=new PdfPCell(new Paragraph("Modelo lector"));
			cabecera2.setPaddingLeft(10);
			cabecera2.setHorizontalAlignment(Element.ALIGN_CENTER);
			cabecera2.setVerticalAlignment(Element.ALIGN_MIDDLE);
			
			
			table_lectores.addCell(cabecera1);
			table_lectores.addCell(cabecera2);
			
			
			for(int i=0;i<lectores.size();i++){
				
				PdfPCell contenido_lector1=new PdfPCell(new Paragraph(lectores.get(i).getTipo()));
				contenido_lector1.setPaddingLeft(10);
				contenido_lector1.setHorizontalAlignment(Element.ALIGN_CENTER);
				contenido_lector1.setVerticalAlignment(Element.ALIGN_MIDDLE);
				
				PdfPCell contenido_lector2=new PdfPCell(new Paragraph(lectores.get(i).getModelo()));
				contenido_lector2.setPaddingLeft(10);
				contenido_lector2.setHorizontalAlignment(Element.ALIGN_CENTER);
				contenido_lector2.setVerticalAlignment(Element.ALIGN_MIDDLE);
				
				
				
				table_lectores.addCell(contenido_lector1);
				table_lectores.addCell(contenido_lector2);
				
			}
			
			
			
			document.add(new Paragraph("Lectores"));
			document.add(table_lectores);
			
			document.close();
			writer.close();
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return pdfName;
		
		
	}

	@Override
	@Transactional(value="miTransactionManager")
	public List<LectorDto> lectorToLectorDto() {
		
		List<Lector> lectores= lectorDAO.findAll();
		List<LectorDto> lectoresDto= new ArrayList<LectorDto>();
		
		for(Lector lector:lectores){
			LectorDto lectorDto=new LectorDto();
			LectorLocalizacion lectLoc=null;
			
			
			lectorDto.setTipo(lector.getTipo());
			lectorDto.setModelo(lector.getModelo());
			
			//lectLoc=lectLocService.buscarPorIdLector(lector.getIdLector());
			//Localizacion loc=localizacionService.buscarLocalizacionPorId(lectLoc.getLocalizacion().getIdLocalizacion());
			
//			lectorDto.setCoord_x(loc.getCoord_x());
//			lectorDto.setCoord_y(loc.getCoord_y());
			
			lectorDto.setCoord_x(lector.getUbicacion().get(0).getLocalizacion().getCoord_x());
			lectorDto.setCoord_y(lector.getUbicacion().get(0).getLocalizacion().getCoord_y());
			
			lectoresDto.add(lectorDto);
		}
		
		return lectoresDto;
	}
	

}
