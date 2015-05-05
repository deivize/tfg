package es.udc.fi.tfg.daos;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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

	@Override
	public List<Activo> findByName(String nombre) {
		Query query= miSessionFactory.getCurrentSession().
				createQuery("FROM Activo WHERE name= :nom");
		query.setParameter("nom",nombre);
		List<Activo> activos=(List<Activo>) query.list();
		
		return activos;
	}

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

}
