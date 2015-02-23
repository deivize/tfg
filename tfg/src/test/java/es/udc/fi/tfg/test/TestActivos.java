package es.udc.fi.tfg.test;

import static org.junit.Assert.*;

import org.apache.log4j.Logger;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import es.udc.fi.tfg.model.Activo;
import es.udc.fi.tfg.services.ActivoService;






@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring-config.xml", "classpath:test-spring-config.xml"})
@ActiveProfiles("test")
public class TestActivos {
	
	
	static Logger log= Logger.getLogger("tfg");
	
	@Autowired
	private TestUtils testUtils;
	
	@Autowired
	private ActivoService activoService;
	
	
	@Before
	public void setUp() throws Exception { 
		log.info ("Inicializando datos para caso de prueba: " + this.getClass().getName());
		testUtils.crearSetDatosPrueba();
		log.info ("Datos creados con éxito");
	}
	
	@After
	public void tearDown() throws Exception {
		log.info ("Eliminando datos para caso de prueba: " + this.getClass().getName());
		testUtils.borrarSetDatosPrueba();  
		log.info ("Datos eliminados con éxito");
	}
	
	
	@Test
	public void testCrearBorrarActivo(){
		//T1 crear un nuevo activo
		Activo miActivo= new Activo("activo23",null,"categoria1",testUtils.etiqueta1);
		//miActivo.getUbicacion().add(testUtils.loc1);
		assertNull(miActivo.getIdActivo());
		activoService.crearActivo(miActivo);
		
		//Comprobar que el activo se ha guardado en la BD
		assertNotNull(miActivo.getIdActivo());
		//assertEquals(activoService.buscarActivoPorId(miActivo.getIdActivo()),miActivo);
		
		//T2 Comprobar el rechazo de duplicados
		boolean duplicado = true;
		try{ activoService.crearActivo(miActivo); } catch (Exception e) { duplicado=false; }
		assertFalse(duplicado);
		
		//T3 Probar el borrado del activo
		activoService.borrarActivo(miActivo);
		assertNull(activoService.buscarActivoPorId(miActivo.getIdActivo()));
		
		
		
	}

}
