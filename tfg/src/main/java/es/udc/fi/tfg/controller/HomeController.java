package es.udc.fi.tfg.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import es.udc.fi.tfg.model.Lector;
import es.udc.fi.tfg.services.LectorService;


@Controller
public class HomeController {
	
	
	@Autowired
	private LectorService lectorService;
	
	@RequestMapping(method=RequestMethod.GET,value={"/","/home"})
	public String mostrarHome(Model model){
		
		List<Lector> lectores=lectorService.buscarLectores();
		model.addAttribute("lectores",lectores);
		
		return "home";
	}

	@RequestMapping(value={"/mapa3d"})
	public String mapa3D(Model model){
		
		return "mapa3d";
	}
}
