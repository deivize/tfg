package es.udc.fi.tfg.services;

import java.io.FileOutputStream;
import java.sql.Timestamp;
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

import es.udc.fi.tfg.daos.ActivoDAO;
import es.udc.fi.tfg.dtos.ActivoAlertaDto;
import es.udc.fi.tfg.dtos.ActivoLocalizacionDto;
import es.udc.fi.tfg.model.Activo;
import es.udc.fi.tfg.model.Localizacion;

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
		Activo activo=null;
		try{
			activo=activoDAO.findById(id);
			log.info("Buscando activo con id: "+id);
		}catch(DataAccessException e){
			log.error("Error al buscar activo con id: "+id);
		}
		return activo;
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

	@Override
	@Transactional(value="miTransactionManager")
	public List<Localizacion> getLocalizacines(Long id) {
		List<Localizacion> localizaciones = null;
		try{
			localizaciones=activoDAO.getLocalizacionesActivo(id);
			log.info("Buscando localizaciones del activo: "+id);
			
		}catch(DataAccessException e){
			log.error("Error al buscar localizaciones del activo: "+id);
		}
		return localizaciones;
	}

	@Override
	@Transactional(value="miTransactionManager")
	public Localizacion getLocalizacionActual(Long id) {
		Localizacion loc=null;
		
		try{
			loc=activoDAO.getLocalizacionActual(id);
			log.info("Buscando localizacion actual para el activo "+id);
		}catch (DataAccessException e){
			log.error("Error al buscar la localizacion actual del actvio "+id);
		}
		
		return loc;
	}

	@Override
	@Transactional(value="miTransactionManager")
	public List<ActivoLocalizacionDto> getLocalizacionesActuales() {
		
		List<ActivoLocalizacionDto> dtos=null;
		
		try{
			dtos=activoDAO.getLocalizacionesActuales();
			log.info("Buscando localizaciones actuales de todos los activos");
		}catch (DataAccessException e){
			log.error("Error al buscar localizaciones actules de todos los activos");
		}
		
		return dtos;
	}

	@Override
	@Transactional(value="miTransactionManager")
	public List<ActivoAlertaDto> getActivosAlerta() {
		
		List<ActivoAlertaDto> activosAlerta=null;
		
		try{
			activosAlerta=activoDAO.getActivosAlerta();
			log.info("Buscando activos para dar una alerta");
		}catch(DataAccessException e){
			log.error("Error buscando activos para alertas");
		}
		
		return activosAlerta;
	}

	@Override
	@Transactional(value="miTransactionManager")
	public String crearPdf(Long id) {
		
		List<Localizacion> localizaciones = null;
		Activo activo=null;
		String pdfName="";
		try{
			activo=activoDAO.findById(id);
			log.info("Buscando activo con id: "+id);
			
		}catch(DataAccessException e){
			log.error("Error al buscar activo con id: "+id);
			
		}
		
		try{
			localizaciones=activoDAO.getLocalizacionesActivo(id);
			log.info("Buscando localizaciones del activo: "+id);
			
		}catch(DataAccessException e){
			log.error("Error al buscar localizaciones del activo: "+id);
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
			
			PdfPTable table_activo=new PdfPTable(3);
			table_activo.setWidthPercentage(100);
			table_activo.setSpacingBefore(10f);
			table_activo.setSpacingAfter(10f);
			
			float[] columnWidths_activo = {1f, 1f, 1f};
			table_activo.setWidths(columnWidths_activo);
			
			PdfPCell cabecera1=new PdfPCell(new Paragraph("Nombre activo"));
			cabecera1.setPaddingLeft(10);
			cabecera1.setHorizontalAlignment(Element.ALIGN_CENTER);
			cabecera1.setVerticalAlignment(Element.ALIGN_MIDDLE);
			
			PdfPCell contenido1=new PdfPCell(new Paragraph(activo.getNombre()));
			contenido1.setPaddingLeft(10);
			contenido1.setHorizontalAlignment(Element.ALIGN_CENTER);
			contenido1.setVerticalAlignment(Element.ALIGN_MIDDLE);
			
			PdfPCell cabecera2=new PdfPCell(new Paragraph("Categoria"));
			cabecera2.setPaddingLeft(10);
			cabecera2.setHorizontalAlignment(Element.ALIGN_CENTER);
			cabecera2.setVerticalAlignment(Element.ALIGN_MIDDLE);
			
			PdfPCell contenido2=new PdfPCell(new Paragraph(activo.getCategoria()));
			contenido2.setPaddingLeft(10);
			contenido2.setHorizontalAlignment(Element.ALIGN_CENTER);
			contenido2.setVerticalAlignment(Element.ALIGN_MIDDLE);
			
			PdfPCell cabecera3=new PdfPCell(new Paragraph("Fecha caducidad"));
			cabecera3.setPaddingLeft(10);
			cabecera3.setHorizontalAlignment(Element.ALIGN_CENTER);
			cabecera3.setVerticalAlignment(Element.ALIGN_MIDDLE);
			
			PdfPCell contenido3=new PdfPCell(new Paragraph(activo.getFechaCaducidad().toString()));
			contenido3.setPaddingLeft(10);
			contenido3.setHorizontalAlignment(Element.ALIGN_CENTER);
			contenido3.setVerticalAlignment(Element.ALIGN_MIDDLE);
			
			table_activo.addCell(cabecera1);
			table_activo.addCell(cabecera2);
			table_activo.addCell(cabecera3);
			
			table_activo.addCell(contenido1);
			table_activo.addCell(contenido2);
			table_activo.addCell(contenido3);
			
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
			
			
			
			document.add(new Paragraph("Datos del activo"));
			document.add(table_activo);
			
			document.add(new Paragraph("Localizaciones del activo"));
			document.add(table_localizaciones);
			
			document.close();
			writer.close();
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return pdfName;
		
		
	}

	@Override
	@Transactional(value="miTransactionManager")
	public List<Activo> buscarActivosConsulta(String nombre, String categoria,
			Timestamp fecha) {
		
		List<Activo> activos=null;
		try{
			if(nombre.equals("")){
				nombre=null;
			}
			if(categoria.equals("")){
				categoria=null;
			}
			activos=activoDAO.buscarActivos(nombre, categoria, fecha);
			log.info("Buscando activos con parametros "+nombre+" "+categoria+" "+fecha);
		}catch(DataAccessException e){
			log.error("Error al buscar activos");
		}
		return activos;
		
	}
	

}
