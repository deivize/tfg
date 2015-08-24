package es.udc.fi.tfg.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import es.udc.fi.tfg.forms.EtiquetaForm;
import es.udc.fi.tfg.model.Estandar;
import es.udc.fi.tfg.model.Etiqueta;
import es.udc.fi.tfg.model.Parametro;
import es.udc.fi.tfg.model.Tecnologia;
import es.udc.fi.tfg.services.EtiquetaService;


@Controller
@RequestMapping(value="/etiquetas")
public class EtiquetaController {
	
	
	@Autowired
	private EtiquetaService etiquetaService;
	
	
	@RequestMapping(method=RequestMethod.GET,value="/nuevaetiqueta")
	public String createEtiquetaProfile(Model model){
		List<Parametro> parametros=etiquetaService.buscarParametros();
		List<Estandar> estandares=etiquetaService.buscarEstandars();
		List<Tecnologia> tecnologias=etiquetaService.buscarTecnologias();
		
		
		model.addAttribute("parametros",parametros);
		model.addAttribute("estandares",estandares);
		model.addAttribute("tecnologias", tecnologias);
		model.addAttribute("etiqueta", new EtiquetaForm());
		
		
		return "nuevaEtiqueta";
	}
	
	@RequestMapping(method=RequestMethod.POST,value="/nuevaetiqueta")
	public String addEtiquetaFromForm(EtiquetaForm etiquetaForm){
		
		Etiqueta etiqueta=new Etiqueta(etiquetaForm.getContenido(),etiquetaForm.getFabricante(),etiquetaForm.getInfoCifrada(),null,null,null);
		//etiquetaService.crearEtiqueta(etiqueta);
		
		return "redirect:/activos/nuevoactivo";
	}

}
