package es.udc.fi.tfg.controller;


import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import es.udc.fi.tfg.dtos.ActivoAlertaDto;
import es.udc.fi.tfg.model.File;
import es.udc.fi.tfg.model.LocalizacionInteres;
import es.udc.fi.tfg.services.ActivoService;
import es.udc.fi.tfg.services.LocalizacionInteresService;
import es.udc.fi.tfg.validator.FileValidator;


@Controller
public class HomeController {
	
	
	@Autowired
	private ActivoService activoService;
	
	@Autowired 
	private FileValidator validator;
	
	@Autowired
	private LocalizacionInteresService locInteresService;
	
	@InitBinder
	private void initBinder(WebDataBinder binder){
		binder.setValidator(validator);
	}
	
	@RequestMapping(method=RequestMethod.GET,value={"/","/home"})
	public String mostrarHome(Model model){
		File file = new File();
		List<ActivoAlertaDto> activos= activoService.getActivosAlerta();
		List<LocalizacionInteres> locsInteres= locInteresService.buscarPorTipo("area");
		model.addAttribute("alertas", activos);
		model.addAttribute("file",file);
		model.addAttribute("areas", locsInteres);
		
		return "home2";
	}

	@RequestMapping(value={"/mapa3d"})
	public String mapa3D(Model model){
		
		return "mapa3d";
	}
	
	@RequestMapping(method= RequestMethod.POST,value={"/","/home"})
	public String fileUpload(Model model, @Validated File file, BindingResult result) throws IOException{
		
		String returnVal= "home2";
		
		if(result.hasErrors()){
			returnVal="home2";
		}else{
			MultipartFile multipartFile=file.getFile();
			//String fileName=multipartFile.getOriginalFilename();
			String fileName="map.jsp";
			multipartFile.transferTo(new java.io.File("C:\\Users\\David\\git\\tfg\\src\\main\\webapp\\resources\\mapas\\"+fileName));
		}
		
		return returnVal;
	}
	
}
