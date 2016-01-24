package es.udc.fi.tfg.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import es.udc.fi.tfg.forms.ActivoForm;
import es.udc.fi.tfg.forms.ConsultaLectorForm;
import es.udc.fi.tfg.model.Lector;
import es.udc.fi.tfg.services.LectorService;

@Controller
@RequestMapping(value="/lectores")
public class LectorController {

	@Autowired
	private LectorService lectorService;
	
	
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
	
	
	
}
