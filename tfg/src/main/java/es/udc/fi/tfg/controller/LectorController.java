package es.udc.fi.tfg.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import es.udc.fi.tfg.dtos.LectorDto;
import es.udc.fi.tfg.forms.ConsultaLectorForm;
import es.udc.fi.tfg.forms.LectorForm;
import es.udc.fi.tfg.model.Lector;
import es.udc.fi.tfg.model.LectorLocalizacion;
import es.udc.fi.tfg.model.Localizacion;
import es.udc.fi.tfg.model.LocalizacionInteres;
import es.udc.fi.tfg.services.LectorLocalizacionService;
import es.udc.fi.tfg.services.LectorService;
import es.udc.fi.tfg.services.LocalizacionInteresService;
import es.udc.fi.tfg.services.LocalizacionService;

@Controller
@RequestMapping(value="/lectores")
public class LectorController {

	@Autowired
	private LectorService lectorService;
	
	@Autowired
	private LocalizacionService localizacionService;
	
	@Autowired
	private LectorLocalizacionService lectLocService;
	
	@Autowired
	private LocalizacionInteresService locInteresService;
	
	private String path="/resources/pdfs/";
	
	private static final int BUFFER_SIZE=4096;
	
	
	@RequestMapping(method=RequestMethod.GET,value="/buscarlectores")
	public String createLectorProfile(Model model){
		
		List<Lector> lectores=new ArrayList<Lector>();
		model.addAttribute("lectres", lectores);
		model.addAttribute("lectorForm", new ConsultaLectorForm());
		
		
		return "buscarLectores";
	}
	
	@RequestMapping(method=RequestMethod.POST,value="/buscarlectores")
	public String consultarLectores(ConsultaLectorForm lectorForm, Model model){
		
		List<Lector> lectores= new ArrayList<Lector>();
		
		lectores=lectorService.buscarLectoresConsulta(lectorForm.getTipo(), lectorForm.getModelo());
		model.addAttribute("lectores", lectores);
		model.addAttribute("lectorForm",lectorForm);
		
		return "buscarLectores";
	}
	
	@RequestMapping(method=RequestMethod.GET,value="/descarga")
	public void descargarInforme(HttpServletRequest request,
            HttpServletResponse response,String tipo,String modelo) throws IOException{
		
			String fileName=lectorService.crearPdf(tipo, modelo);

			String filePath=path+fileName+".pdf";

			ServletContext context = request.getSession().getServletContext();
			String appPath = context.getRealPath("");
			System.out.println("appPath = " + appPath);

			String fullPath = appPath + filePath;      
			File downloadFile = new File(fullPath);
			FileInputStream inputStream = new FileInputStream(downloadFile);

			String mimeType = context.getMimeType(fullPath);
			if (mimeType == null) {
				// set to binary type if MIME mapping not found
				mimeType = "application/octet-stream";
			}
			System.out.println("MIME type: " + mimeType);

			// set content attributes for the response
			response.setContentType(mimeType);
			response.setContentLength((int) downloadFile.length());

			// set headers for the response
			String headerKey = "Content-Disposition";
			String headerValue = String.format("attachment; filename=\"%s\"",
					downloadFile.getName());
			response.setHeader(headerKey, headerValue);

			// get output stream of the response
			OutputStream outStream = response.getOutputStream();

			byte[] buffer = new byte[BUFFER_SIZE];
			int bytesRead = -1;

			// write bytes read from the input stream into the output stream
			while ((bytesRead = inputStream.read(buffer)) != -1) {
				outStream.write(buffer, 0, bytesRead);
			}

			inputStream.close();
			outStream.close();

		
	}
	
	@RequestMapping(method=RequestMethod.GET,value="/nuevolector")
	public String crearLector(Model model){
		
		List<LectorDto> lectoresDto=lectorService.lectorToLectorDto();
		List<LocalizacionInteres> locsInteres= locInteresService.buscarPorTipo("area");
		
		model.addAttribute("lectores", lectoresDto);
		model.addAttribute("areas",locsInteres);
		model.addAttribute("lectorForm", new LectorForm());
		
		
		return "nuevoLector";
	}
	
	@RequestMapping(method=RequestMethod.POST,value="/nuevolector")
	public String guardarLector(LectorForm lectorForm,Model model){
		
		
		
		String x= lectorForm.getCoord_x();
		String y= lectorForm.getCoord_y();
		
		String[]  coord_x= x.split("-"); 
		String[]  coord_y= y.split("-");
		
		for(int i=1;i<coord_x.length;i++){
			
			Timestamp ts= new Timestamp(Calendar.getInstance().getTime().getTime());
			Localizacion loc= new Localizacion(Double.parseDouble(coord_x[i]),Double.parseDouble(coord_y[i]), 0d, lectorForm.getEdificio(), lectorForm.getPlanta(), lectorForm.getArea(), lectorForm.getZona(), ts);

			Lector lector = new Lector(lectorForm.getModelo(),lectorForm.getTipo());
			
			lectorService.crearLector(lector);
			localizacionService.crearLocalizacion(loc);
			
			LectorLocalizacion lectLoc = new LectorLocalizacion();
			lectLoc.setLocalizacion(loc);
			lectLoc.setLector(lector);
			lectLoc.setFecha(ts);
			
			lectLocService.crearLectorLocalizacion(lectLoc);
			
			
		}
		
		
		return crearLector(model);
	}
	
	
	
}
