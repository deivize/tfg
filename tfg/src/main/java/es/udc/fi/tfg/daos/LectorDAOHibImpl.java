package es.udc.fi.tfg.daos;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import es.udc.fi.tfg.model.Activo;
import es.udc.fi.tfg.model.Lector;

@Repository
public class LectorDAOHibImpl implements LectorDAO {
	
	@Autowired
	private SessionFactory miSessionFactory;

	@Override
	public Long create(Lector lector) {
		if(lector.getIdLector()!=null){
			throw new RuntimeException("Intento de creacion de lector ya persistente");
		}
		
		Long lectorId= (Long)miSessionFactory.getCurrentSession().save(lector);
		return lectorId;
	}

	@Override
	public List<Lector> findAll() {
		List<Lector> lectores= (List<Lector>) miSessionFactory.getCurrentSession().
				createQuery("FROM Lector").list();
				
		return lectores;
	}

	@Override
	public void update(Lector lector) {

		miSessionFactory.getCurrentSession().update(lector);
		
	}

	@Override
	public void remove(Lector lector) {
		
		miSessionFactory.getCurrentSession().delete(lector);
		
	}
	
	

}
