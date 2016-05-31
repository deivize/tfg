package es.udc.fi.tfg.daos;

import java.util.List;




import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import es.udc.fi.tfg.model.LocalizacionInteres;

@Repository
public class LocalizacionInteresDAOHibImpl implements LocalizacionInteresDAO {
	
	
	@Autowired
	private SessionFactory miSessionFactory;

	@Override
	public Long create(LocalizacionInteres locInteres) {
		
		if(locInteres.getIdLocInteres()!=null){
			throw new RuntimeException("Intento de creacion de activo ya persistente");
		}
		
		Long idLocInteres= (Long) miSessionFactory.getCurrentSession().save(locInteres);
		
		return idLocInteres;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<LocalizacionInteres> findAll() {
		
		List<LocalizacionInteres> locsInteres= miSessionFactory.getCurrentSession()
				.createQuery("FROM LocalizacionInteres").list();
		
		return locsInteres;
	}

	@Override
	public void update(LocalizacionInteres locInteres) {
		
		miSessionFactory.getCurrentSession().update(locInteres);
		
	}

	@Override
	public void remove(LocalizacionInteres locInteres) {
		
		miSessionFactory.getCurrentSession().delete(locInteres);
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<LocalizacionInteres> findByTipo(String tipo) {
		
		Query query = miSessionFactory.getCurrentSession()
				.createQuery("SELECT l FROM LocalizacionInteres l inner join l.mapa WHERE tipo= :tipo AND l.mapa.activo=TRUE ");
		query.setParameter("tipo", tipo);
		
		List<LocalizacionInteres> locsInteres= query.list();
		
		
		return locsInteres;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<LocalizacionInteres> findLocsInteresMapa() {
		List<LocalizacionInteres> locsInteres= miSessionFactory.getCurrentSession()
				.createQuery("SELECT l FROM LocalizacionInteres l inner join l.mapa WHERE l.mapa.activo=TRUE").list();
		
		return locsInteres;
	}

}
