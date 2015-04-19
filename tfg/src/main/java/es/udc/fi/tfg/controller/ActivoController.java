package es.udc.fi.tfg.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import es.udc.fi.tfg.model.Activo;
import es.udc.fi.tfg.model.Etiqueta;
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
	
	@RequestMapping(method=RequestMethod.GET,params="new")
	public String createActivoProfile(Model model){
	
		model.addAttribute("activo", new Activo(null,null,null,null));
		return "nuevoactivo";
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public String addActivoFromForm(Activo activo){
		
		Etiqueta etiqueta=etiquetaService.buscarEtiquetaPorId(1L);
		activo.setEtiqueta(etiqueta);
		activoService.crearActivo(activo);
		return "redirect:/home";
	}
	
	@RequestMapping(method=RequestMethod.GET,params="delete")
	public String deleteActivo(Activo activo){
		
		activoService.borrarActivo(activo);
		return "redirect:/home";
	}
	
}
