package es.udc.fi.tfg.daos;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import es.udc.fi.tfg.model.Estandar;

@Repository
public class EstandarDAOHibImpl implements EstandarDAO {
	
	@Autowired
	private SessionFactory miSessionFactory;

	@Override
	public Long create(Estandar estandar) {
		
		if(estandar.getIdEstandar()!=null){
			throw new RuntimeException("Intento de creacion de estandar ya persistente");
		}
		
		Long estandarId= (Long)miSessionFactory.getCurrentSession().save(estandar);
		return estandarId;
		
	}

	@Override
	public void remove(Estandar estandar) {
		
		miSessionFactory.getCurrentSession().delete(estandar);
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Estandar> findAll() {
		Query query=miSessionFactory.getCurrentSession().createQuery("FROM Estandar");
		
		List<Estandar> estandar=query.list();
		
		return estandar;
	}

	@Override
	public Estandar findById(Long id) {
		Query query=miSessionFactory.getCurrentSession().createQuery("FROM Estandar WHERE idEstandar= :id");
		
		query.setParameter("id", id);
		
		Estandar estandar= (Estandar) query.uniqueResult();
		
		return estandar;
	}

}
