package es.udc.fi.tfg.daos;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import es.udc.fi.tfg.model.Localizacion;

@Repository
public class LocalizacionDAOHibImpl implements LocalizacionDAO {
	
	@Autowired
	private SessionFactory miSessionFactory;

	@Override
	public Long create(Localizacion localizacion) {
		if(localizacion.getIdLocalizacion()!=null){
			throw new RuntimeException("Intento de creacion de localizacion ya persistente");
		}
		
		Long localizacionId= (Long)miSessionFactory.getCurrentSession().save(localizacion);
		return localizacionId;
	}

	@Override
	public List<Localizacion> findAll() {
		List<Localizacion> localizaciones= (List<Localizacion>) miSessionFactory.getCurrentSession().
				createQuery("FROM Localizacion").list();
				
		return localizaciones;
		
	}

	@Override
	public List<Localizacion> findByEdificio(String edificio) {
		Query query= miSessionFactory.getCurrentSession().
				createQuery("FROM Localizacion WHERE edificio= :edf");
		query.setParameter("edf", edificio);
		List<Localizacion> localizaciones= (List<Localizacion>)query.list();
				
		return localizaciones;
	}
	
	@Override
	public Localizacion findById(Long id){
		Query query= miSessionFactory.getCurrentSession().
				createQuery("FROM Localizacion WHERE idLocalizacion= :id");
		query.setParameter("id", id);
		
		Localizacion localizacion= (Localizacion) query.uniqueResult();
		
		return localizacion;
		
	}

	@Override
	public void update(Localizacion edificio) {
		
		miSessionFactory.getCurrentSession().update(edificio);
		
	}

	@Override
	public void remove(Localizacion edificio) {

		miSessionFactory.getCurrentSession().delete(edificio);
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Localizacion> findByFiltro(String edificio, Long planta,
			String area, String zona) {
		
		List<Localizacion> localizaciones=null;
		
		Criteria cri=miSessionFactory.getCurrentSession().createCriteria(Localizacion.class);
		
		if(edificio!=null){
			cri.add(Restrictions.eq("edificio",edificio));
		}
		
		if(planta!=null){
			cri.add(Restrictions.eq("planta",planta));
		}
		
		if(area!=null){
			cri.add(Restrictions.eq("area",area));
		}
		
		if(zona!=null){
			cri.add(Restrictions.eq("zona",zona));
		}
		
		localizaciones=cri.list();
		
		return localizaciones;
	}
	
	

}
