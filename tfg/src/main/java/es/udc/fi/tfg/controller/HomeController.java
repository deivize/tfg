package es.udc.fi.tfg.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import es.udc.fi.tfg.model.Activo;
import es.udc.fi.tfg.services.ActivoService;


@Controller
public class HomeController {
	
	
	@Autowired
	private ActivoService activoService;
	
	@RequestMapping(method=RequestMethod.GET,value={"/","/home"})
	public String mostrarHome(Model model){
		
		List<Activo> activos= activoService.getActivosAlerta();
		model.addAttribute("alertas", activos);
		
		return "home";
	}

	@RequestMapping(value={"/mapa3d"})
	public String mapa3D(Model model){
		
		return "mapa3d";
	}
}
