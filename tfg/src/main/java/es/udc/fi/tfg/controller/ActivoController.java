package es.udc.fi.tfg.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import es.udc.fi.tfg.forms.ActivoForm;
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
		List<Etiqueta> etiquetas=etiquetaService.buscarEtiquetas();
		model.addAttribute("etiquetas", etiquetas);
		model.addAttribute("activo", new ActivoForm());
		return "nuevoactivo";
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public String addActivoFromForm(ActivoForm activoForm){
		
		Etiqueta etiqueta=etiquetaService.buscarEtiquetaPorId(activoForm.getEtiqueta());
		Activo activo=new Activo(activoForm.getNombre(),null,activoForm.getCategoria(),etiqueta);
		activoService.crearActivo(activo);
		return "redirect:/home";
	}
	
	@RequestMapping(method=RequestMethod.GET,params="delete")
	public String deleteActivo(Activo activo){
		
		activoService.borrarActivo(activo);
		return "redirect:/home";
	}
	
}
