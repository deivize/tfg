package es.udc.fi.tgf.test;

import java.sql.Timestamp;
import java.util.Calendar;

import org.springframework.beans.factory.annotation.Autowired;

import es.udc.fi.tfg.model.Activo;
import es.udc.fi.tfg.model.Estandar;
import es.udc.fi.tfg.model.Etiqueta;
import es.udc.fi.tfg.model.Localizacion;
import es.udc.fi.tfg.model.Parametro;
import es.udc.fi.tfg.model.Tecnologia;
import es.udc.fi.tfg.services.ActivoService;

public class TestUtils {
	
	
	@Autowired
	private ActivoService activoService;
	
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
	
	
	public void createSetDatosPrueba(){
		
		estandar1= new Estandar("estandar1");
		estandar2= new Estandar("estandar2");
		
		tecnologia1= new Tecnologia("tec1","tec 1.1");
		tecnologia2= new Tecnologia("tec2", "tec 2.1");
		
		parametro1= new Parametro("param1","val1");
		parametro1= new Parametro("param2","val2");
		
		etiqueta1= new Etiqueta("contenido1","fabricante1",true,tecnologia1,estandar1,parametro1);
		etiqueta2= new Etiqueta("contenido2","fabricante2",false,tecnologia2,estandar2,parametro2);
		etiqueta3= new Etiqueta("contenido3","fabricante3",true,tecnologia1,estandar2,parametro1);
		
		activo1= new Activo("activo1",null,"categoria1",etiqueta1);
		activo2= new Activo("activo2",null,"categoria2",etiqueta2);
		activo3= new Activo("activo3",null,"categoria3",etiqueta3);
		
		loc1= new Localizacion(43L,21L,54L,"edificio1",1L,"area1","zona1",new Timestamp(Calendar.getInstance().getTimeInMillis()));
		try { Thread.sleep(timeout); } catch (InterruptedException e) {}
		loc2= new Localizacion(34L,76L,12L,"edificio2",5L,"area3","zona4",new Timestamp(Calendar.getInstance().getTimeInMillis()));
		try { Thread.sleep(timeout); } catch (InterruptedException e) {}
		loc3= new Localizacion(65L,12L,78L,"edificio3",4L,"area6","zona7",new Timestamp(Calendar.getInstance().getTimeInMillis()));
		
		
		activo1.getUbicacion().add(0,loc1);
		activo1.getUbicacion().add(0,loc2);
		activo2.getUbicacion().add(0,loc3);		
		activo3.getUbicacion().add(0,loc1);
		
		//Activada la propagacion en activo se guardaran sus localizaciones y etiquetas sin necesidad de hacerlo explicitamente
		activoService.crearActivo(activo1);
		activoService.crearActivo(activo2);
		activoService.crearActivo(activo3);
		
		
		
	}
	
	public void borrarSetDatosPrueba(){
		
		for(Activo a:activoService.buscarActivos()){
			activoService.borrarActivo(a);
		}
		
	}
	
	
	
}
