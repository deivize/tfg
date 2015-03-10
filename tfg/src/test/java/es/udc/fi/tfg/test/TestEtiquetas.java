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

import es.udc.fi.tfg.model.Etiqueta;
import es.udc.fi.tfg.services.EtiquetaService;



@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring-config.xml", "classpath:test-spring-config.xml"})
@ActiveProfiles("test")
public class TestEtiquetas {
	
	
	static Logger log= Logger.getLogger("tfg");
	
	@Autowired
	private TestUtils testUtils;

	@Autowired
	private EtiquetaService etiquetaService;
	
	
	
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
	public void testCrearBorrarEtiqueta(){
		
		//T1 crear la etiqueta
		Etiqueta miEtiqueta= new Etiqueta("contenido145","fabricante87",true,testUtils.tecnologia1,testUtils.estandar1,testUtils.parametro1);
		assertNull(miEtiqueta.getIdEtiqueta());
		etiquetaService.crearEtiqueta(miEtiqueta);
		
		//Comprobar que la etiqueta se guarda en la base de datos
		assertNotNull(miEtiqueta.getIdEtiqueta());
		Etiqueta etiqueta1=etiquetaService.buscarEtiquetaPorId(miEtiqueta.getIdEtiqueta());
		//assertEquals(etiquetaService.buscarEtiquetaPorId(miEtiqueta.getIdEtiqueta()),miEtiqueta);
		assertEquals(etiqueta1.getIdEtiqueta(),miEtiqueta.getIdEtiqueta());
		assertEquals(etiqueta1.getContenido(),miEtiqueta.getContenido());
		assertEquals(etiqueta1.getFabricante(),miEtiqueta.getFabricante());
		assertEquals(etiqueta1.getInfoCifrada(),miEtiqueta.getInfoCifrada());
		assertEquals(etiqueta1.getEstandar(),miEtiqueta.getEstandar());
		assertEquals(etiqueta1.getParametros(),miEtiqueta.getParametros());
		assertEquals(etiqueta1.getTecnologia(),miEtiqueta.getTecnologia());
		//assertEquals(etiqueta1.getLectores(),miEtiqueta.getLectores());		
		
		//T2 Comprobar el rechazo de duplicados
		boolean duplicado = true;
		try{ etiquetaService.crearEtiqueta(miEtiqueta); } catch (Exception e) { duplicado=false; }
		assertFalse(duplicado);
		
		
		//T3 Comprobar el borrado de la etiqueta
		etiquetaService.borrarEtiqueta(miEtiqueta);
		assertNull(etiquetaService.buscarEtiquetaPorId(miEtiqueta.getIdEtiqueta()));
		
		
	}
	
	@Test
	public void testModificarEtiqueta(){
		
		//Crear una etiqueta
		Etiqueta miEtiqueta= new Etiqueta("contenido145","fabricante87",true,testUtils.tecnologia1,testUtils.estandar1,testUtils.parametro1);
		assertNull(miEtiqueta.getIdEtiqueta());
		etiquetaService.crearEtiqueta(miEtiqueta);
		
		//Modificar algun campo de la etiqueta
		miEtiqueta.setContenido("Contenido modificado");
		etiquetaService.modificarEtiqueta(miEtiqueta);
		Etiqueta etiqueta1=etiquetaService.buscarEtiquetaPorId(miEtiqueta.getIdEtiqueta());
		//Comprobar que se ha modificado correctamente
		assertEquals(etiqueta1.getIdEtiqueta(),miEtiqueta.getIdEtiqueta());
		assertEquals(etiqueta1.getContenido(),miEtiqueta.getContenido());
		assertEquals(etiqueta1.getFabricante(),miEtiqueta.getFabricante());
		assertEquals(etiqueta1.getInfoCifrada(),miEtiqueta.getInfoCifrada());
		assertEquals(etiqueta1.getEstandar(),miEtiqueta.getEstandar());
		assertEquals(etiqueta1.getParametros(),miEtiqueta.getParametros());
		assertEquals(etiqueta1.getTecnologia(),miEtiqueta.getTecnologia());
		
		etiquetaService.borrarEtiqueta(miEtiqueta);
		
	}
	
	
}
