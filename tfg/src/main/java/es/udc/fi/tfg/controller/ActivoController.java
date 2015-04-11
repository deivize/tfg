package es.udc.fi.tfg.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import es.udc.fi.tfg.model.Activo;
import es.udc.fi.tfg.services.ActivoService;


@Controller
@RequestMapping(value="/activos")
public class ActivoController {
	
	@Autowired
	private ActivoService activoService;
	
	@RequestMapping(value="/listactivos")
	public String listActivos(Model model){
		
		List<Activo> activos=activoService.buscarActivos();
		model.addAttribute("activos", activos);
		
		return "listactivos";
	}
	

}
