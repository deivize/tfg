package es.udc.fi.tfg.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import es.udc.fi.tfg.forms.ActivoForm;
import es.udc.fi.tfg.model.Activo;
import es.udc.fi.tfg.model.Etiqueta;
import es.udc.fi.tfg.model.Localizacion;
import es.udc.fi.tfg.services.ActivoService;
import es.udc.fi.tfg.services.EtiquetaService;



@Controller
@RequestMapping(value="/activos")
public class ActivoController {
	
	@Autowired
	private ActivoService activoService;
	
	@Autowired
	private EtiquetaService etiquetaService;
	
	@RequestMapping(value="/listactivos")
	public String listActivos(Model model){
		
		List<Activo> activos=activoService.buscarActivos();
		model.addAttribute("activos", activos);
		
		return "listactivos";
	}
	
	@RequestMapping(method=RequestMethod.GET,value="/nuevoactivo")
	public String createActivoProfile(Model model){
		List<Etiqueta> etiquetas=etiquetaService.buscarEtiquetas();
		model.addAttribute("etiquetas", etiquetas);
		model.addAttribute("activo", new ActivoForm());
		return "nuevoactivo";
	}
	
	@RequestMapping(method=RequestMethod.POST,value="/nuevoactivo")
	public String addActivoFromForm(ActivoForm activoForm){
		
		Etiqueta etiqueta=etiquetaService.buscarEtiquetaPorId(activoForm.getEtiqueta());
		Activo activo=new Activo(activoForm.getNombre(),null,activoForm.getCategoria(),etiqueta);
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
		List<Localizacion> localizaciones=activoService.getLocalizacines(id);
		model.addAttribute("localizaciones", localizaciones);
		
		return "verrecorrido";
	}
}
