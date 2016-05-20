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
import es.udc.fi.tfg.forms.ConsultaLocalizacionForm;
import es.udc.fi.tfg.forms.LocInteresForm;
import es.udc.fi.tfg.forms.LugarForm;
import es.udc.fi.tfg.model.Localizacion;
import es.udc.fi.tfg.model.LocalizacionInteres;
import es.udc.fi.tfg.services.LectorService;
import es.udc.fi.tfg.services.LocalizacionInteresService;
import es.udc.fi.tfg.services.LocalizacionService;

@Controller
@RequestMapping(value="/localizaciones")
public class LocalizacionController {
	
	@Autowired
	private LocalizacionInteresService locInteresService;
	
	@Autowired
	private LocalizacionService locService;
	
	@Autowired
	private LectorService lectorService;
	
	private String path="/resources/pdfs/";
	
	private static final int BUFFER_SIZE=4096;
	
	@RequestMapping(method=RequestMethod.GET,value={"/areas"})
	public String localizacionesInteres(Model model){
		
		List<LocalizacionInteres> locsInteres= locInteresService.buscarPorTipo("area");
		List<LectorDto> lectoresDto=lectorService.lectorToLectorDto();
		
		List<LocalizacionInteres> escaleras= locInteresService.buscarPorTipo("escalera");
		List<LocalizacionInteres> ascensores= locInteresService.buscarPorTipo("ascensor");
		List<LocalizacionInteres> banos= locInteresService.buscarPorTipo("bano");
		List<LocalizacionInteres> despachos= locInteresService.buscarPorTipo("despacho");
		
		model.addAttribute("areas",locsInteres);
		model.addAttribute("lectores",lectoresDto);
		model.addAttribute("escaleras",escaleras);
		model.addAttribute("ascensores",ascensores);
		model.addAttribute("banos", banos);
		model.addAttribute("despachos", despachos);
		model.addAttribute("locInteresForm",new LocInteresForm());
		
		return "localizacionesInteres";
	}
	
	@RequestMapping(method=RequestMethod.POST,value="/areas")
	public String guardarLocInteres(LocInteresForm locInteresForm,Model model){
		
		String x= locInteresForm.getCoord_x();
		String y= locInteresForm.getCoord_y();
		String w= locInteresForm.getWidth();
		String h= locInteresForm.getHeight();
		String tipo= locInteresForm.getTipo();
		
		String[]  coord_x= x.split("-"); 
		String[]  coord_y= y.split("-");
		String[]  width= w.split("-");
		String[]  height= h.split("-");
		
		LocalizacionInteres locInteres=null;
		Localizacion loc=null;
		
		for(int i=1;i<coord_x.length;i++){
//			System.out.println("********************************************");
//			System.out.println("++++++++++++++++++++++++++++++++"+coord_x[i]);
			
			if(!(Double.parseDouble(width[i]) <= 0) || !(Double.parseDouble(height[i]) <= 0)){
				Timestamp ts=new Timestamp(Calendar.getInstance().getTime().getTime());
				loc= new Localizacion(Double.parseDouble(coord_x[i]),Double.parseDouble(coord_y[i]),0d,"",0l,"","",ts);
				
				locInteres= new LocalizacionInteres(tipo,Double.parseDouble(width[i]),Double.parseDouble(height[i]),"",loc);
				locInteresService.crearLocInteres(locInteres);
			}
			
		}
		
		return localizacionesInteres(model);
	}
	
	@RequestMapping(method=RequestMethod.GET,value={"/lugares"})
	public String lugaresInteres(Model model){
		
		List<LocalizacionInteres> locsInteres= locInteresService.buscarPorTipo("area");
		List<LectorDto> lectoresDto=lectorService.lectorToLectorDto();
		
		List<LocalizacionInteres> escaleras= locInteresService.buscarPorTipo("escalera");
		List<LocalizacionInteres> ascensores= locInteresService.buscarPorTipo("ascensor");
		List<LocalizacionInteres> banos= locInteresService.buscarPorTipo("bano");
		List<LocalizacionInteres> despachos= locInteresService.buscarPorTipo("despacho");
		
		model.addAttribute("areas",locsInteres);
		model.addAttribute("lectores",lectoresDto);
		model.addAttribute("escaleras",escaleras);
		model.addAttribute("ascensores",ascensores);
		model.addAttribute("banos", banos);
		model.addAttribute("despachos", despachos);
		model.addAttribute("lugaresForm",new LugarForm());
		
		return "lugares";
	}

	@RequestMapping(method=RequestMethod.POST,value="/lugares")
	public String guardarLugarInteres(LugarForm lugarForm,Model model){
		
		String esc_coord_x=lugarForm.getEscalera_coord_x();
		String esc_coord_y=lugarForm.getEscalera_coord_y();
		String asc_coord_x=lugarForm.getAscensor_coord_x();
		String asc_coord_y=lugarForm.getAscensor_coord_y();
		String bano_coord_x=lugarForm.getBano_coord_x();
		String bano_coord_y=lugarForm.getBano_coord_y();
		String des_coord_x=lugarForm.getDespacho_coord_x();
		String des_coord_y=lugarForm.getDespacho_coord_y();
		
		String[] esc_x=esc_coord_x.split("-");
		String[] esc_y=esc_coord_y.split("-");
		String[] asc_x=asc_coord_x.split("-");
		String[] asc_y=asc_coord_y.split("-");
		String[] bano_x=bano_coord_x.split("-");
		String[] bano_y=bano_coord_y.split("-");
		String[] des_x=des_coord_x.split("-");
		String[] des_y=des_coord_y.split("-");
		
		LocalizacionInteres locInteres=null;
		
		if(esc_x.length>=1){
			for(int i=1;i<esc_x.length;i++){
				locInteres= new LocalizacionInteres("escalera",Double.parseDouble(esc_x[i]),Double.parseDouble(esc_y[i]),"",null);
				locInteresService.crearLocInteres(locInteres);
			}
		}
		
		if(asc_x.length>=1){
			for(int i=1;i<asc_x.length;i++){
				locInteres= new LocalizacionInteres("ascensor",Double.parseDouble(asc_x[i]),Double.parseDouble(asc_y[i]),"",null);
				locInteresService.crearLocInteres(locInteres);
			}
		}
		
		if(bano_x.length>=1){
			for(int i=1;i<bano_x.length;i++){
				locInteres= new LocalizacionInteres("bano",Double.parseDouble(bano_x[i]),Double.parseDouble(bano_y[i]),"",null);
				locInteresService.crearLocInteres(locInteres);
			}
		}
		
		if(des_x.length>=1){
			for(int i=1;i<des_x.length;i++){
				locInteres= new LocalizacionInteres("despacho",Double.parseDouble(des_x[i]),Double.parseDouble(des_y[i]),"",null);
				locInteresService.crearLocInteres(locInteres);
			}
		}
		
		return lugaresInteres(model);
	}
	
	@RequestMapping(method=RequestMethod.GET,value="/buscarlocalizaciones")
	public String buscarLocalizaciones(Model model){
		
		List<Localizacion> localizaciones=new ArrayList<Localizacion>();
		
		model.addAttribute("localizaciones", localizaciones);
		model.addAttribute("localizacionForm", new ConsultaLocalizacionForm());
		
		
		return "buscarLocalizaciones";
	}
	
	@RequestMapping(method=RequestMethod.POST,value="/buscarlocalizaciones")
	public String consultarLocalizaciones(ConsultaLocalizacionForm localizacionForm,Model model){
		
		List<Localizacion> localizaciones=locService.buscarPorFiltro(localizacionForm.getEdificio(), localizacionForm.getPlanta(), localizacionForm.getArea(), localizacionForm.getZona());
		
		model.addAttribute("localizaciones", localizaciones);
		model.addAttribute("localizacionForm", localizacionForm);
		
		return "buscarLocalizaciones";
	}
	
	@RequestMapping(method=RequestMethod.GET,value="/descarga")
	public void descargarInforme(HttpServletRequest request,
            HttpServletResponse response,String edificio,Long planta,String area,String zona) throws IOException{
		
			String fileName=locService.crearPdf(edificio,planta,area,zona);

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
	
}
