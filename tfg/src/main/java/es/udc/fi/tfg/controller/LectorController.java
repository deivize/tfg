package es.udc.fi.tfg.controller;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

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
		model.addAttribute("lectorForm",new ConsultaLectorForm());
		
		return "buscarLectores";
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
