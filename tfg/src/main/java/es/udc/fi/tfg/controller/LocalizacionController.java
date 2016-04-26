package es.udc.fi.tfg.controller;

import java.sql.Timestamp;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import es.udc.fi.tfg.forms.LocInteresForm;
import es.udc.fi.tfg.model.Localizacion;
import es.udc.fi.tfg.model.LocalizacionInteres;
import es.udc.fi.tfg.services.LocalizacionInteresService;

@Controller
@RequestMapping(value="/localizaciones")
public class LocalizacionController {
	
	@Autowired
	private LocalizacionInteresService locInteresService;
	
	@RequestMapping(method=RequestMethod.GET,value={"/areas"})
	public String localizacionesInteres(Model model){
		
		List<LocalizacionInteres> locsInteres= locInteresService.buscarPorTipo("area");
		
		model.addAttribute("areas",locsInteres);
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

}
