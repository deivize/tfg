package es.udc.fi.tfg.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import es.udc.fi.tfg.forms.EstandarForm;
import es.udc.fi.tfg.forms.EtiquetaForm;
import es.udc.fi.tfg.forms.ParametroForm;
import es.udc.fi.tfg.forms.TecnologiaForm;
import es.udc.fi.tfg.model.Estandar;
import es.udc.fi.tfg.model.Etiqueta;
import es.udc.fi.tfg.model.Parametro;
import es.udc.fi.tfg.model.Tecnologia;
import es.udc.fi.tfg.services.EtiquetaService;
import es.udc.fi.tfg.validator.EtiquetaValidator;


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
	public String addEtiquetaFromForm(@ModelAttribute("etiqueta") 
	@Valid EtiquetaForm etiquetaForm,BindingResult result,Model model){
		
		EtiquetaValidator etiquetaValidator=new EtiquetaValidator();
		etiquetaValidator.validate(etiquetaForm, result);
		
		if(result.hasErrors()){
			List<Parametro> parametros=etiquetaService.buscarParametros();
			List<Estandar> estandares=etiquetaService.buscarEstandars();
			List<Tecnologia> tecnologias=etiquetaService.buscarTecnologias();
			
			
			model.addAttribute("parametros",parametros);
			model.addAttribute("estandares",estandares);
			model.addAttribute("tecnologias", tecnologias);
			model.addAttribute("etiqueta", new EtiquetaForm());
			return "";
		}else{
			
		
		
		Parametro parametro= etiquetaService.buscarParametroPorId(etiquetaForm.getParametro());
		Tecnologia tecnologia=etiquetaService.buscarTecnologiaPorId(etiquetaForm.getTecnologia());
		Estandar estandar=etiquetaService.buscarEstandarPorId(etiquetaForm.getEstandar());
		Boolean infoCifrada=null;
		if(etiquetaForm.getInfoCifrada().equals("TRUE")){
			infoCifrada=true;
		}else{
			infoCifrada=false;
		}
		
		
		Etiqueta etiqueta=new Etiqueta(etiquetaForm.getContenido(),etiquetaForm.getFabricante(),
				infoCifrada,tecnologia,estandar,parametro);
		etiquetaService.crearEtiqueta(etiqueta);
		
		return "redirect:/activos/nuevoactivo";
		
		}
	}
	
	
	@RequestMapping(method=RequestMethod.GET,value="/nuevoparametro")
	public String createParametroProfile(Model model){

		model.addAttribute("parametro",new ParametroForm());
		
		return "nuevoParametro";
	}
	
	@RequestMapping(method=RequestMethod.POST,value="/nuevoparametro")
	public String addParametroFromForm(ParametroForm parametroForm){
		
		Parametro parametro=new Parametro(parametroForm.getNombre(),parametroForm.getValor());
		
		etiquetaService.crearParametro(parametro);
		
		return "redirect:nuevaetiqueta";
	}
	
	@RequestMapping(method=RequestMethod.GET,value="/nuevoestandar")
	public String createEstandarProfile(Model model){
		
		model.addAttribute("estandar", new EstandarForm());
	
		return "nuevoEstandar";
	}
	
	@RequestMapping(method=RequestMethod.POST,value="/nuevoestandar")
	public String addEstandarFromForm(EstandarForm estandarForm){
		
		Estandar estandar=new Estandar(estandarForm.getNombre());
		
		etiquetaService.crearEstandar(estandar);
		
		return "redirect:nuevaetiqueta";
	}
	
	@RequestMapping(method=RequestMethod.GET,value="/nuevatecnologia")
	public String createTecnologiaProfile(Model model){
		
		model.addAttribute("tecnologia", new TecnologiaForm());
		
		return "nuevaTecnologia";
	}
	
	@RequestMapping(method=RequestMethod.POST,value="/nuevatecnologia")
	public String addTecnologiaFromForm(TecnologiaForm tecnologiaForm){
		
		Tecnologia tecnologia=new Tecnologia(tecnologiaForm.getTipo(),tecnologiaForm.getSubtipo());
		
		etiquetaService.crearTecnologia(tecnologia);
		
		return "redirect:nuevaetiqueta";
	}
	
}
