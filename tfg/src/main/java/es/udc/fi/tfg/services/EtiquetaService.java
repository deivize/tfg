package es.udc.fi.tfg.services;

import java.util.List;

import es.udc.fi.tfg.model.Estandar;
import es.udc.fi.tfg.model.Etiqueta;
import es.udc.fi.tfg.model.Parametro;
import es.udc.fi.tfg.model.Tecnologia;

public interface EtiquetaService {
	
	void crearEtiqueta(Etiqueta miEtiqueta);
	void modificarEtiqueta(Etiqueta miEtiqueta);
	void borrarEtiqueta(Etiqueta miEtiqueta);
	List<Etiqueta> buscarEtiquetas();
	Etiqueta buscarEtiquetaPorId(Long id);
	List<Etiqueta> buscarEtiquetasLibres();
	
	void crearEstandar(Estandar miEstandar);
	void borrarEstandar(Estandar miEstandar);
	
	void crearParametro(Parametro miParametro);
	void borrarParametro(Parametro miParametro);
	
	void crearTecnologia(Tecnologia miTecnologia);
	void borrarTecnologia(Tecnologia miTecnologia);

}
