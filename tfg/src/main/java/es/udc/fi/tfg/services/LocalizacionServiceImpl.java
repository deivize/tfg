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

	@Override
	@Transactional(value="miTransactionManager")
	public List<Localizacion> buscarPorFiltro(String edificio, Long planta,
			String area, String zona) {
		
		if(edificio.equals("")){
			edificio=null;
		}
		if(area.equals("")){
			area=null;
		}
		if(zona.equals("")){
			zona=null;
		}
		
		
		List<Localizacion> localizaciones=null;
		try{
			localizaciones=localizacionDAO.findByFiltro(edificio, planta, area, zona);
			log.info("Buscando localizaciones con filtro: "+edificio+","+planta+","+area+","+zona);
		}catch(DataAccessException e){
			log.info("Error buscando localizaciones con filtro: "+edificio+","+planta+","+area+","+zona);
		}
		
		
		return localizaciones;
	}

	@Override
	@Transactional(value="miTransactionManager")
	public String crearPdf(String edificio, Long planta, String area,
			String zona) {
		
		if(edificio.equals("")){
			edificio=null;
		}
		if(area.equals("")){
			area=null;
		}
		if(zona.equals("")){
			zona=null;
		}
		
		List<Localizacion> localizaciones = null;
		String pdfName="";
		
		try{
			localizaciones=localizacionDAO.findByFiltro(edificio, planta, area, zona);
			log.info("Buscando localizaciones con filtro: "+edificio+","+planta+","+area+","+zona);
			
		}catch(DataAccessException e){
			log.info("Error buscando localizaciones con filtro: "+edificio+","+planta+","+area+","+zona);
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
			
			
			PdfPTable table_localizaciones=new PdfPTable(5);
			table_localizaciones.setWidthPercentage(100);
			table_localizaciones.setSpacingBefore(10f);
			table_localizaciones.setSpacingAfter(10f);
			
			float[] columnWidths_localizaciones = {1f, 1f, 1f, 1f, 1f};
			table_localizaciones.setWidths(columnWidths_localizaciones);
			
			PdfPCell cabecera_loc1=new PdfPCell(new Paragraph("Edificio"));
			cabecera_loc1.setPaddingLeft(10);
			cabecera_loc1.setHorizontalAlignment(Element.ALIGN_CENTER);
			cabecera_loc1.setVerticalAlignment(Element.ALIGN_MIDDLE);
			
			PdfPCell cabecera_loc2=new PdfPCell(new Paragraph("Planta"));
			cabecera_loc2.setPaddingLeft(10);
			cabecera_loc2.setHorizontalAlignment(Element.ALIGN_CENTER);
			cabecera_loc2.setVerticalAlignment(Element.ALIGN_MIDDLE);
			
			PdfPCell cabecera_loc3=new PdfPCell(new Paragraph("Area"));
			cabecera_loc3.setPaddingLeft(10);
			cabecera_loc3.setHorizontalAlignment(Element.ALIGN_CENTER);
			cabecera_loc3.setVerticalAlignment(Element.ALIGN_MIDDLE);
			
			PdfPCell cabecera_loc4=new PdfPCell(new Paragraph("Zona"));
			cabecera_loc4.setPaddingLeft(10);
			cabecera_loc4.setHorizontalAlignment(Element.ALIGN_CENTER);
			cabecera_loc4.setVerticalAlignment(Element.ALIGN_MIDDLE);
			
			PdfPCell cabecera_loc5=new PdfPCell(new Paragraph("Fecha"));
			cabecera_loc5.setPaddingLeft(10);
			cabecera_loc5.setHorizontalAlignment(Element.ALIGN_CENTER);
			cabecera_loc5.setVerticalAlignment(Element.ALIGN_MIDDLE);
			
			table_localizaciones.addCell(cabecera_loc1);
			table_localizaciones.addCell(cabecera_loc2);
			table_localizaciones.addCell(cabecera_loc3);
			table_localizaciones.addCell(cabecera_loc4);
			table_localizaciones.addCell(cabecera_loc5);
			
			for(int i=0;i<localizaciones.size();i++){
				
				PdfPCell contenido_loc1=new PdfPCell(new Paragraph(localizaciones.get(i).getEdificio()));
				contenido_loc1.setPaddingLeft(10);
				contenido_loc1.setHorizontalAlignment(Element.ALIGN_CENTER);
				contenido_loc1.setVerticalAlignment(Element.ALIGN_MIDDLE);
				
				PdfPCell contenido_loc2=new PdfPCell(new Paragraph(localizaciones.get(i).getPlanta().toString()));
				contenido_loc2.setPaddingLeft(10);
				contenido_loc2.setHorizontalAlignment(Element.ALIGN_CENTER);
				contenido_loc2.setVerticalAlignment(Element.ALIGN_MIDDLE);
				
				PdfPCell contenido_loc3=new PdfPCell(new Paragraph(localizaciones.get(i).getArea()));
				contenido_loc3.setPaddingLeft(10);
				contenido_loc3.setHorizontalAlignment(Element.ALIGN_CENTER);
				contenido_loc3.setVerticalAlignment(Element.ALIGN_MIDDLE);
				
				PdfPCell contenido_loc4=new PdfPCell(new Paragraph(localizaciones.get(i).getZona()));
				contenido_loc4.setPaddingLeft(10);
				contenido_loc4.setHorizontalAlignment(Element.ALIGN_CENTER);
				contenido_loc4.setVerticalAlignment(Element.ALIGN_MIDDLE);
				
				PdfPCell contenido_loc5=new PdfPCell(new Paragraph(localizaciones.get(i).getFecha().toString()));
				contenido_loc5.setPaddingLeft(10);
				contenido_loc5.setHorizontalAlignment(Element.ALIGN_CENTER);
				contenido_loc5.setVerticalAlignment(Element.ALIGN_MIDDLE);
				
				
				table_localizaciones.addCell(contenido_loc1);
				table_localizaciones.addCell(contenido_loc2);
				table_localizaciones.addCell(contenido_loc3);
				table_localizaciones.addCell(contenido_loc4);
				table_localizaciones.addCell(contenido_loc5);
				
			}
			
			
			
			document.add(new Paragraph("Localizaciones"));
			document.add(table_localizaciones);
			
			document.close();
			writer.close();
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return pdfName;
		
		
	}
	

}
