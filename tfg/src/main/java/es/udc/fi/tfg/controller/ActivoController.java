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

import es.udc.fi.tfg.dtos.ActivoLocalizacionDto;
import es.udc.fi.tfg.dtos.LectorDto;
import es.udc.fi.tfg.dtos.TrazadoDto;
import es.udc.fi.tfg.forms.ActivoForm;
import es.udc.fi.tfg.forms.ConsultaActivoForm;
import es.udc.fi.tfg.forms.TrazadoForm;
import es.udc.fi.tfg.model.Activo;
import es.udc.fi.tfg.model.Etiqueta;
import es.udc.fi.tfg.model.Localizacion;
import es.udc.fi.tfg.model.LocalizacionInteres;
import es.udc.fi.tfg.model.Mapa;
import es.udc.fi.tfg.services.ActivoService;
import es.udc.fi.tfg.services.EtiquetaService;
import es.udc.fi.tfg.services.LectorService;
import es.udc.fi.tfg.services.LocalizacionInteresService;
import es.udc.fi.tfg.services.MapaService;



@Controller
@RequestMapping(value="/activos")
public class ActivoController {
	
	@Autowired
	private ActivoService activoService;
	
	@Autowired
	private EtiquetaService etiquetaService;
	
	@Autowired
	private LectorService lectorService;
	
	@Autowired
	private MapaService mapaService;
	
	@Autowired
	private LocalizacionInteresService locInteresService;
	
	
	private String path="/resources/pdfs/";
	
	private static final int BUFFER_SIZE=4096;
	
	
	@RequestMapping(value="/listactivos")
	public String listActivos(Model model){
		
		List<Activo> activos=activoService.buscarActivosMapa();
		List<ActivoLocalizacionDto> actLoc=activoService.getLocalizacionesActuales();
		List<LectorDto> lectoresDto=lectorService.lectorToLectorDto();
		model.addAttribute("lectores", lectoresDto);
		model.addAttribute("localizaciones",actLoc);
		model.addAttribute("activos", activos);
				
		return "listactivos2";
	}
	
	@RequestMapping(method=RequestMethod.GET,value="/nuevoactivo")
	public String createActivoProfile(Model model){
		List<Etiqueta> etiquetas=etiquetaService.buscarEtiquetasLibres();
		model.addAttribute("etiquetas", etiquetas);
		model.addAttribute("activo", new ActivoForm());
		return "nuevoactivo2";
	}
	
	@RequestMapping(method=RequestMethod.POST,value="/nuevoactivo")
	public String addActivoFromForm(ActivoForm activoForm){
		
		Mapa mapa=mapaService.buscarMapaActivo();
		Etiqueta etiqueta=etiquetaService.buscarEtiquetaPorId(activoForm.getEtiqueta());
		Activo activo=new Activo(activoForm.getNombre(),null,activoForm.getCategoria(),etiqueta);
		activo.setMapa(mapa);
		Timestamp ts= new Timestamp(activoForm.getFechaCaducidad().getTime());
		activo.setFechaCaducidad(ts);
		activoService.crearActivo(activo);
		return "redirect:/home";
	}
	
	@RequestMapping(value="/borraractivo")
	public String listaBorradoActivo(Model model){
		List<Activo> activos=activoService.buscarActivos();
		model.addAttribute("activos", activos);
		model.addAttribute("activo",new Activo(null,null,null,null));
		return "borraractivo";
	}
	
	
	@RequestMapping(method=RequestMethod.POST,value="/borraractivo")
	public String deleteActivo(Activo activo){
		
		activoService.borrarActivo(activo);
		return "redirect:/activos/borraractivo";
	}
	
	@RequestMapping(value="/verRecorrido")
	public String verRecorrido(Model model, Long id){
		List<Localizacion> localizaciones_=activoService.getLocalizacines(id);
		Activo activo=activoService.buscarActivoPorId(id);
		String mapaActivo=mapaService.buscarMapaActivo().getNombre();
		ArrayList<ArrayList<Double>> coordenadas= new ArrayList<ArrayList<Double>>();
		List<LocalizacionInteres> locsInteres= locInteresService.buscarPorTipo("area");
		List<LocalizacionInteres> escaleras= locInteresService.buscarPorTipo("escalera");
		List<LocalizacionInteres> ascensores= locInteresService.buscarPorTipo("ascensor");
		List<LocalizacionInteres> banos= locInteresService.buscarPorTipo("bano");
		List<LocalizacionInteres> despachos= locInteresService.buscarPorTipo("despacho");
		
		for(Localizacion loc:localizaciones_){
			ArrayList<Double> cood=new ArrayList<Double>();
			cood.add(0,loc.getCoord_x());
			cood.add(1,loc.getCoord_y());
			coordenadas.add(cood);
		}
		ArrayList<Double> coord= new ArrayList<Double>();
		for(Localizacion loc:localizaciones_){
			coord.add(loc.getCoord_x());
			coord.add(loc.getCoord_y());
		}
		ArrayList<ArrayList<Double>> paths=new ArrayList<ArrayList<Double>>();
		for(int i=0;i<coord.size()-2;i=i+2){
			ArrayList<Double> cood=new ArrayList<Double>();
			cood.add(0,coord.get(i));
			cood.add(1,coord.get(i+1));
			cood.add(2,coord.get(i+2));
			cood.add(3,coord.get(i+3));
			
			
			paths.add(cood);
		}
		Localizacion locActual=activoService.getLocalizacionActual(id);
		List<LectorDto> lectoresDto=lectorService.lectorToLectorDto();
		model.addAttribute("lectores", lectoresDto);
		model.addAttribute("activo",activo);
		model.addAttribute("coordenadas",coordenadas);
		model.addAttribute("localizaciones", localizaciones_);
		model.addAttribute("paths", paths);
		model.addAttribute("path_size",paths.size());
		model.addAttribute("idActivo",id);
		model.addAttribute("mapaActivo",mapaActivo);
		
		model.addAttribute("areas",locsInteres);
		model.addAttribute("escaleras",escaleras);
		model.addAttribute("ascensores",ascensores);
		model.addAttribute("banos", banos);
		model.addAttribute("despachos", despachos);
		
		return "verrecorrido2";
	}
	
	
	@RequestMapping(method=RequestMethod.GET,value="/buscaractivos")
	public String createActivoConsultaProfile(Model model){
		
		List<Activo> activos= new ArrayList<Activo>();
		model.addAttribute("listaActivos",activos);
		model.addAttribute("activoForm",new ConsultaActivoForm());
		
		return "buscarActivos";
	}
	
	@RequestMapping(method=RequestMethod.POST,value="/buscaractivos")
	public String consultarActivos(ConsultaActivoForm activoForm,Model model){
		
		List<Activo> activos=new ArrayList<Activo>();
		Timestamp ts= null;
		if(activoForm.getFechaCaducidad()!=null){
			ts= new Timestamp(activoForm.getFechaCaducidad().getTime());
		}
		activos= activoService.buscarActivosConsulta(activoForm.getNombre(), activoForm.getCategoria(), ts);
		model.addAttribute("listaActivos",activos);
		model.addAttribute("activoForm",new ConsultaActivoForm());
		
		return "buscarActivos";
	}
	
	@RequestMapping(method=RequestMethod.GET,value="/descarga")
	public void descargarInforme(HttpServletRequest request,
            HttpServletResponse response,Long id) throws IOException{
		
		String fileName=activoService.crearPdf(id);
		
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
	
	@RequestMapping(value="/vertrazados")
	public String verTrazados(Model model){
		
		Mapa mapaActivo=mapaService.buscarMapaActivo();
		ArrayList<TrazadoDto> trazados=new ArrayList<TrazadoDto>();
		
		model.addAttribute("trazadoForm",new TrazadoForm());
		model.addAttribute("mapaActivo", mapaActivo.getNombre());
		model.addAttribute("trazados",trazados);
		
		return "verTrazados";
	}
	
	@RequestMapping(value="/vertrazados",method=RequestMethod.POST)
	public String consultarTrazados(Model model,TrazadoForm trazadoForm){
		
		Mapa mapaActivo=mapaService.buscarMapaActivo();
		Timestamp fechaDesde=null;
		Timestamp fechaHasta=null;
		
		if(trazadoForm.getFechaDesde()!=null){
			Calendar cal= Calendar.getInstance();
			cal.setTime(trazadoForm.getFechaDesde());
			if(cal.get(Calendar.YEAR)!=2200){
				fechaDesde=new Timestamp(trazadoForm.getFechaDesde().getTime());
			}
		}
		
		if(trazadoForm.getFechaHasta()!=null){
			Calendar cal= Calendar.getInstance();
			cal.setTime(trazadoForm.getFechaHasta());
			if(cal.get(Calendar.YEAR)!=2200){
				fechaHasta=new Timestamp(trazadoForm.getFechaHasta().getTime());
			}
		}
		List<TrazadoDto> trazados=activoService.buscarTrazados(fechaDesde, fechaHasta);
		
		
		model.addAttribute("trazadoForm",new TrazadoForm());
		model.addAttribute("mapaActivo", mapaActivo.getNombre());
		model.addAttribute("trazados",trazados);
		
		
		return "verTrazados";
	}
	
	
}
