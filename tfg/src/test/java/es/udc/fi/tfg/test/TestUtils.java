package es.udc.fi.tfg.test;

import java.sql.Timestamp;
import java.util.Calendar;

import org.springframework.beans.factory.annotation.Autowired;

import es.udc.fi.tfg.model.Activo;
import es.udc.fi.tfg.model.ActivoLocalizacion;
import es.udc.fi.tfg.model.Estandar;
import es.udc.fi.tfg.model.Etiqueta;
import es.udc.fi.tfg.model.Localizacion;
import es.udc.fi.tfg.model.Parametro;
import es.udc.fi.tfg.model.Tecnologia;
import es.udc.fi.tfg.services.ActivoService;
import es.udc.fi.tfg.services.EtiquetaService;
import es.udc.fi.tfg.services.LocalizacionService;

public class TestUtils {
	
	
	@Autowired
	private ActivoService activoService;
	
	@Autowired
	private EtiquetaService etiquetaService;
	
	@Autowired
	private LocalizacionService localizacionService;
	
	public final long timeout = 50;
	
	public Activo activo1;
	public Activo activo2;
	public Activo activo3;
	
	public Etiqueta etiqueta1;
	public Etiqueta etiqueta2;
	public Etiqueta etiqueta3;
	
	public Estandar estandar1;
	public Estandar estandar2;
	
	public Tecnologia tecnologia1;
	public Tecnologia tecnologia2;
	
	public Parametro parametro1;
	public Parametro parametro2;
	
	public Localizacion loc1;
	public Localizacion loc2;
	public Localizacion loc3;
	
	public ActivoLocalizacion activoLoc1;
	public ActivoLocalizacion activoLoc11;
	public ActivoLocalizacion activoLoc2;
	public ActivoLocalizacion activoLoc3;
	
	public void crearSetDatosPrueba(){
		
		estandar1= new Estandar("estandar1");
		estandar2= new Estandar("estandar2");
		
		tecnologia1= new Tecnologia("tec1","tec 1.1");
		tecnologia2= new Tecnologia("tec2", "tec 2.1");
		
		parametro1= new Parametro("param1","val1");
		parametro2= new Parametro("param2","val2");
		
		etiqueta1= new Etiqueta("contenido1","fabricante1",true,tecnologia1,estandar1,parametro1);
		etiqueta2= new Etiqueta("contenido2","fabricante2",false,tecnologia2,estandar2,parametro2);
		etiqueta3= new Etiqueta("contenido3","fabricante3",true,tecnologia1,estandar2,parametro1);
		
		activo1= new Activo("activo1",null,"categoria1",etiqueta1);
		activo2= new Activo("activo2",null,"categoria2",etiqueta2);
		activo3= new Activo("activo3",null,"categoria3",etiqueta3);
		
		loc1= new Localizacion(43D,21D,54D,"edificio1",1L,"area1","zona1",new Timestamp(Calendar.getInstance().getTimeInMillis()));
		localizacionService.crearLocalizacion(loc1);
		try { Thread.sleep(timeout); } catch (InterruptedException e) {}
		loc2= new Localizacion(34D,76D,12D,"edificio2",5L,"area3","zona4",new Timestamp(Calendar.getInstance().getTimeInMillis()));
		localizacionService.crearLocalizacion(loc2);
		try { Thread.sleep(timeout); } catch (InterruptedException e) {}
		loc3= new Localizacion(65D,12D,78D,"edificio3",4L,"area6","zona7",new Timestamp(Calendar.getInstance().getTimeInMillis()));
		localizacionService.crearLocalizacion(loc3);
		
		ActivoLocalizacion activoLoc1= new ActivoLocalizacion();
		activoLoc1.setActivo(activo1);
		activoLoc1.setLocalizacion(loc1);
		activoLoc1.setFecha(new Timestamp(Calendar.getInstance().getTimeInMillis()));
		
		ActivoLocalizacion activoLoc11= new ActivoLocalizacion();
		activoLoc11.setActivo(activo1);
		activoLoc11.setLocalizacion(loc2);
		activoLoc11.setFecha(new Timestamp(Calendar.getInstance().getTimeInMillis()));
		
		try { Thread.sleep(timeout); } catch (InterruptedException e) {}
		
		ActivoLocalizacion activoLoc2= new ActivoLocalizacion();
		activoLoc2.setActivo(activo2);
		activoLoc2.setLocalizacion(loc2);
		activoLoc2.setFecha(new Timestamp(Calendar.getInstance().getTimeInMillis()));
		
		try { Thread.sleep(timeout); } catch (InterruptedException e) {}
		
		ActivoLocalizacion activoLoc3= new ActivoLocalizacion();
		activoLoc3.setActivo(activo3);
		activoLoc3.setLocalizacion(loc3);
		activoLoc3.setFecha(new Timestamp(Calendar.getInstance().getTimeInMillis()));
		
		activo1.getUbicacion().add(0,activoLoc1);
		activo1.getUbicacion().add(1,activoLoc11);
		activo2.getUbicacion().add(0,activoLoc2);		
		activo3.getUbicacion().add(0,activoLoc3);
		
		
		activoService.crearActivo(activo1);
		activoService.crearActivo(activo2);
		activoService.crearActivo(activo3);
		
		
		
	}
	
	public void borrarSetDatosPrueba(){
		
		for(Activo a:activoService.buscarActivos()){
			activoService.borrarActivo(a);
		}
		
		for(Etiqueta e:etiquetaService.buscarEtiquetas()){
			etiquetaService.borrarEtiqueta(e);
		}
		
		etiquetaService.borrarEstandar(estandar1);
		etiquetaService.borrarEstandar(estandar2);
		
		etiquetaService.borrarTecnologia(tecnologia1);
		etiquetaService.borrarTecnologia(tecnologia2);
		
		etiquetaService.borrarParametro(parametro1);
		etiquetaService.borrarParametro(parametro2);
		
		
		
		localizacionService.borrarLocalizacion(loc1);
		localizacionService.borrarLocalizacion(loc2);
		localizacionService.borrarLocalizacion(loc3);
		
		
	}
	
	
	
}
