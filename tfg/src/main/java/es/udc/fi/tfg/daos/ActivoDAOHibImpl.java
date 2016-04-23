package es.udc.fi.tfg.daos;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import es.udc.fi.tfg.dtos.ActivoAlertaDto;
import es.udc.fi.tfg.dtos.ActivoLocalizacionDto;
import es.udc.fi.tfg.model.Activo;
import es.udc.fi.tfg.model.ActivoLocalizacion;
import es.udc.fi.tfg.model.Localizacion;

@Repository
public class ActivoDAOHibImpl implements ActivoDAO {
	
	@Autowired
	private SessionFactory miSessionFactory;
	

	@Override
	public Long create(Activo activo) {
		
		if(activo.getIdActivo()!=null){
			throw new RuntimeException("Intento de creacion de activo ya persistente");
		}
		
		
		
		Long activoId= (Long)miSessionFactory.getCurrentSession().save(activo);
		return activoId;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Activo> findByName(String nombre) {
		Query query= miSessionFactory.getCurrentSession().
				createQuery("FROM Activo WHERE name= :nom");
		query.setParameter("nom",nombre);
		List<Activo> activos=(List<Activo>) query.list();
		
		return activos;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Activo> findAll() {
		List<Activo> activos= (List<Activo>) miSessionFactory.getCurrentSession().
				createQuery("FROM Activo").list();
				
		return activos;
	}

	@Override
	public Activo findById(Long id){
		Query query= miSessionFactory.getCurrentSession().
				createQuery("FROM Activo WHERE idActivo= :id");
		query.setParameter("id", id);
		
		Activo activo= (Activo) query.uniqueResult();
		
		return activo;
		
	}
	
	
	@Override
	public void update(Activo activo) {
		
		miSessionFactory.getCurrentSession().update(activo);
		
	}

	@Override
	public void remove(Activo activo) {

		miSessionFactory.getCurrentSession().delete(activo);
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Localizacion> getLocalizacionesActivo(Long id) {
//		Query query=miSessionFactory.getCurrentSession().createQuery("SELECT b.idlocalizacion,b.coord_x,b.coord_y,b.coord_z,b.edificio,b.planta,b.area,b.zona,b.fecha "
//				+ "FROM ActivoLocalizacion a JOIN localizacion b "
//				+ "ON a.idlocalizacion=b.idlocalizacion "
//				+ "WHERE a.pkAL.activo.idactivo= :id ORDER BY a.fecha ASC");
//		query.setParameter("id", id);
		
		Query query1=miSessionFactory.getCurrentSession().createQuery("FROM ActivoLocalizacion WHERE idactivo= :id ORDER BY fecha ASC");
		query1.setParameter("id",id);
		List<ActivoLocalizacion> activoLocalizaciones= (List<ActivoLocalizacion>) query1.list();
		
		List<Long> idLocalizaciones= new ArrayList<Long>();
		for(ActivoLocalizacion actLoc:activoLocalizaciones){
			idLocalizaciones.add(actLoc.getLocalizacion().getIdLocalizacion());
		}
		
		
		List<Localizacion> localizaciones=new ArrayList<Localizacion>();
		for(Long idLoc:idLocalizaciones){
			Query query2 = miSessionFactory.getCurrentSession().createQuery("FROM Localizacion WHERE idLocalizacion= :idLoc");
			query2.setParameter("idLoc", idLoc);
			Localizacion auxLoc =(Localizacion) query2.uniqueResult();
			localizaciones.add(auxLoc);
		}
		
		
//		List<Localizacion> localizaciones=(List<Localizacion>) query.list();
		return localizaciones;
	}

	@Override
	public Localizacion getLocalizacionActual(Long id) {
		
		//Query query=miSessionFactory.getCurrentSession().createQuery("FROM Localizacion WHERE idLocalizacion=(SELECT idLocalizacion FROM ActivoLocalizacion WHERE idActivo=:idAct AND fecha>=ALL(SELECT fecha FROM ActivoLocalizacion WHERE idActivo= :idAct))");
		
		Query query1=miSessionFactory.getCurrentSession().createQuery("FROM ActivoLocalizacion WHERE idActivo=:idAct AND fecha>=ALL(SELECT fecha FROM ActivoLocalizacion WHERE idActivo= :idAct)");
		query1.setParameter("idAct", id);
		ActivoLocalizacion activoLoc=(ActivoLocalizacion) query1.uniqueResult();
		Long idLoc=activoLoc.getLocalizacion().getIdLocalizacion();
		
		Query query2=miSessionFactory.getCurrentSession().createQuery("FROM Localizacion WHERE idLocalizacion= :idLoc");
		query2.setParameter("idLoc", idLoc);
		
		
		Localizacion loc= (Localizacion) query2.uniqueResult();
		
		return loc;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ActivoLocalizacionDto> getLocalizacionesActuales() {
		
		List<ActivoLocalizacionDto> dtos=new ArrayList<ActivoLocalizacionDto>();
		
		
		
		
		Query query1=miSessionFactory.getCurrentSession().createQuery("FROM ActivoLocalizacion WHERE fecha in(SELECT max(fecha) FROM ActivoLocalizacion GROUP BY idActivo) ");
		List<ActivoLocalizacion> activoLocalizaciones=query1.list();
		
		
		Long idLoc=null;
		Long idAct=null;
		for(ActivoLocalizacion actLoc:activoLocalizaciones){
			idLoc=actLoc.getLocalizacion().getIdLocalizacion();
			idAct=actLoc.getActivo().getIdActivo();
			
			Query query2=miSessionFactory.getCurrentSession().createQuery("FROM Localizacion WHERE idLocalizacion= :idLoc");
			query2.setParameter("idLoc", idLoc);
			
			Query query3=miSessionFactory.getCurrentSession().createQuery("FROM Activo WHERE idActivo= :idAct");
			query3.setParameter("idAct", idAct);
			
			Localizacion loc=(Localizacion) query2.uniqueResult();
			Activo act=(Activo) query3.uniqueResult();
			
			ActivoLocalizacionDto actLocDto=new ActivoLocalizacionDto();
			
			actLocDto.setNombreActivo(act.getNombre());
			actLocDto.setCoord_x(loc.getCoord_x());
			actLocDto.setCoord_y(loc.getCoord_y());
			actLocDto.setCoord_z(loc.getCoord_z());
			
			dtos.add(actLocDto);
		
		}
		
		
		
		return dtos;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ActivoAlertaDto> getActivosAlerta() {
		
		List<ActivoAlertaDto> activosAlertaDto=new ArrayList<ActivoAlertaDto>();
		List<Activo> activosAlerta=new ArrayList<Activo>();
		
		Calendar cal= Calendar.getInstance();
		Date date= cal.getTime();
		
		
		Timestamp fecha= new Timestamp(date.getTime());
		
		Query query= miSessionFactory.getCurrentSession().createQuery("FROM Activo WHERE fechaCaducidad<= :fecha");
		query.setParameter("fecha", fecha);
		
		activosAlerta=query.list();
		
		
		for(Activo act:activosAlerta){
			
			Query query2= miSessionFactory.getCurrentSession().createQuery("FROM ActivoLocalizacion WHERE idActivo = :idAct AND fecha>=ALL(SELECT fecha FROM ActivoLocalizacion WHERE idActivo= :idAct)");
			query2.setParameter("idAct", act.getIdActivo());
			ActivoLocalizacion activoLoc= (ActivoLocalizacion) query2.uniqueResult();
			//System.out.println("**********************************"+activoLoc.getLocalizacion().getIdLocalizacion());
			
			if(activoLoc != null){

				Query query3=miSessionFactory.getCurrentSession().createQuery("FROM Localizacion WHERE idLocalizacion= :idLoc");
				query3.setParameter("idLoc", activoLoc.getLocalizacion().getIdLocalizacion());
				Localizacion loc=(Localizacion) query3.uniqueResult();

				ActivoAlertaDto actAlerta= new ActivoAlertaDto();
				actAlerta.setNombre(act.getNombre());
				actAlerta.setCategoria(act.getCategoria());
				actAlerta.setCoord_x(loc.getCoord_x());
				actAlerta.setCoord_y(loc.getCoord_y());
				actAlerta.setCoord_z(loc.getCoord_z());
				actAlerta.setFechaCaducidad(act.getFechaCaducidad());

				activosAlertaDto.add(actAlerta);
			}
		}
		
		return activosAlertaDto;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Activo> buscarActivos(String nombre, String categoria,
			Timestamp fecha) {
		
		List<Activo> activos= new ArrayList<Activo>();
		
		
		String query="FROM Activo ";
		
		if(nombre!=null && categoria!=null){
			
			query= query + " WHERE nombre= :nombre AND categoria= :categoria";
			
		}else if(nombre!=null && categoria==null){
			query=query + " WHERE nombre= :nombre";
		}else if(nombre==null && categoria!=null){
			query=query+" WHERE categoria= :categoria";
		}
		
		
		Query consulta= miSessionFactory.getCurrentSession().createQuery(query);
		if(nombre!=null){
			consulta.setParameter("nombre", nombre);
		}
		if(categoria!=null){
			consulta.setParameter("categoria", categoria);
		}
		
		activos=consulta.list();
		
		return activos;
	}

}
