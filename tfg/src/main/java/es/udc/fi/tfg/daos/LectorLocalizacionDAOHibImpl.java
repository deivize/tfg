package es.udc.fi.tfg.daos;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import es.udc.fi.tfg.model.LectorLocalizacion;

@Repository
public class LectorLocalizacionDAOHibImpl implements LectorLocalizacionDAO {

	@Autowired
	private SessionFactory miSessionFactory;
	
	@Override
	public void create(LectorLocalizacion lectLoc) {
		miSessionFactory.getCurrentSession().save(lectLoc);
		
	}

	@Override
	public LectorLocalizacion getLectorLocalizacionByLectorId(Long id) {
		
		Query query= miSessionFactory.getCurrentSession().
				createQuery("FROM LectorLocalizacion WHERE idLector= :idLect");
		query.setParameter("idLect", id);
		
		LectorLocalizacion lectLoc= (LectorLocalizacion) query.uniqueResult();
		
		return lectLoc;
	}
	
	
}
