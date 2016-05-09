package es.udc.fi.tfg.controller;


import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import es.udc.fi.tfg.dtos.ActivoAlertaDto;
import es.udc.fi.tfg.dtos.LectorDto;
import es.udc.fi.tfg.forms.MapaForm;
import es.udc.fi.tfg.model.File;
import es.udc.fi.tfg.model.LocalizacionInteres;
import es.udc.fi.tfg.model.Mapa;
import es.udc.fi.tfg.services.ActivoService;
import es.udc.fi.tfg.services.LectorService;
import es.udc.fi.tfg.services.LocalizacionInteresService;
import es.udc.fi.tfg.services.MapaService;
import es.udc.fi.tfg.validator.FileValidator;


@Controller
public class HomeController {
	
	@Autowired
	private LectorService lectorService;
	
	@Autowired
	private ActivoService activoService;
	
	@Autowired 
	private FileValidator validator;
	
	@Autowired
	private LocalizacionInteresService locInteresService;
	
	@Autowired
	private MapaService mapaService;
	
//	@InitBinder
//	private void initBinder(WebDataBinder binder){
//		binder.setValidator(validator);
//	}
	
	@RequestMapping(method=RequestMethod.GET,value={"/","/home"})
	public String mostrarHome(Model model) throws IOException {
		File file = new File();
		List<ActivoAlertaDto> activos= activoService.getActivosAlerta();
		List<LocalizacionInteres> locsInteres= locInteresService.buscarPorTipo("area");
		List<LectorDto> lectoresDto=lectorService.lectorToLectorDto();
		String mapaActivo=mapaService.buscarMapaActivo().getNombre();
		
//		DefaultResourceLoader loader = new DefaultResourceLoader();
//		Resource resource = loader.getResource("classpath:/maps");
		//java.io.File folder = resource.getFile();
		//java.io.File test_file = new java.io.File("./../../../../../../webapp/WEB-INF/views/maps/");
		java.io.File folder = new java.io.File("C:\\Users\\David\\git\\tfg\\src\\main\\webapp\\resources\\svgs");
		java.io.File[] listOfFiles= folder.listFiles();
		List<String> fileNames = new ArrayList<String>();
		for(java.io.File file_:listOfFiles){
			fileNames.add(file_.getName());
		}
		
		model.addAttribute("mapaForm",new MapaForm());
		model.addAttribute("lectores",lectoresDto);
		model.addAttribute("alertas", activos);
		model.addAttribute("file",file);
		model.addAttribute("areas", locsInteres);
		model.addAttribute("mapaActivo",mapaActivo);
		model.addAttribute("mapas",fileNames);
		
		
		return "home2";
	}

	@RequestMapping(value={"/mapa3d"})
	public String mapa3D(Model model){
		
		return "mapa3d";
	}
	
	@RequestMapping(method= RequestMethod.POST,value={"/","/home"})
	public String cambiarMapa(Model model,MapaForm mapaForm) throws IOException{
		
		Mapa mapaActivo= mapaService.buscarMapaActivo();
		Mapa nuevoMapaActivo= mapaService.buscarMapaPorNombre(mapaForm.getNombre());
		
		mapaActivo.setActivo(false);
		nuevoMapaActivo.setActivo(true);
		
		mapaService.actualizarMapa(mapaActivo);
		mapaService.actualizarMapa(nuevoMapaActivo);
		
		return mostrarHome(model);
	}
	
	
//	@RequestMapping(method= RequestMethod.POST,value={"/","/home"})
//	public String fileUpload(Model model, @Validated File file, BindingResult result) throws IOException{
//		
//		String returnVal= "home2";
//		
//		if(result.hasErrors()){
//			returnVal="home2";
//		}else{
//			MultipartFile multipartFile=file.getFile();
//			//String fileName=multipartFile.getOriginalFilename();
//			String fileName="map.jsp";
//			multipartFile.transferTo(new java.io.File("C:\\Users\\David\\git\\tfg\\src\\main\\webapp\\resources\\mapas\\"+fileName));
//		}
//		
//		return returnVal;
//	}
	
}
