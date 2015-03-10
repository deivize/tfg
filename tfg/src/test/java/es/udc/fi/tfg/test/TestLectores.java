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

import es.udc.fi.tfg.model.Lector;
import es.udc.fi.tfg.services.LectorService;




@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring-config.xml", "classpath:test-spring-config.xml"})
@ActiveProfiles("test")
public class TestLectores {

	static Logger log= Logger.getLogger("tfg");
	
	@Autowired
	private TestUtils testUtils;
	
	@Autowired
	private LectorService lectorService;
	
	
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
	public void crearBorrarLector(){
		
		//T1 Crear el lector
		Lector miLector= new Lector("modelo1","tipo1");
		assertNull(miLector.getIdLector());
		lectorService.crearLector(miLector);
		
		//Comprobar que el lector se guarda en la base de datos
		assertNotNull(miLector.getIdLector());
		Lector lector1 = lectorService.buscarLectorPorId(miLector.getIdLector());
		assertEquals(lector1.getIdLector(),miLector.getIdLector());
		assertEquals(lector1.getModelo(),miLector.getModelo());
		assertEquals(lector1.getTipo(),miLector.getTipo());
		//assertEquals(lector1.getEtiquetas(),miLector.getEtiquetas());
		//assertEquals(lector1.getUbicacion(),miLector.getUbicacion());
		
		
		
		//T2 Comprobar el rechazo de duplicados
		boolean duplicado = true;
		try{ lectorService.crearLector(miLector); } catch (Exception e) { duplicado=false; }
		assertFalse(duplicado);
		
		//T3 Comprobar que se borra el lector
		lectorService.borrarLector(miLector);
		assertNull(lectorService.buscarLectorPorId(miLector.getIdLector()));
		
		
	}
	
	
	
	@Test
	public void testModificarLector(){
		
		//Crear un lector
		Lector miLector= new Lector("modelo1","tipo1");
		assertNull(miLector.getIdLector());
		lectorService.crearLector(miLector);
		
		//Modificar algun campo del lector
		miLector.setModelo("modelo modificado");
		lectorService.modificarLector(miLector);
		//Comprobar que se ha modificado correctamente
		Lector lector1 = lectorService.buscarLectorPorId(miLector.getIdLector());
		assertEquals(lector1.getIdLector(),miLector.getIdLector());
		assertEquals(lector1.getModelo(),miLector.getModelo());
		assertEquals(lector1.getTipo(),miLector.getTipo());
		
		lectorService.borrarLector(miLector);
		
	}
	
	
	
}
