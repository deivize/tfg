package es.udc.fi.tfg.daos;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import es.udc.fi.tfg.model.Parametro;

@Repository
public class ParametroDAOHibImpl implements ParametroDAO {
	
	@Autowired
	private SessionFactory miSessionFactory;

	@Override
	public Long create(Parametro parametro) {
		
		if(parametro.getIdParametro()!=null){
			throw new RuntimeException("Intento de creacion de parametro ya persistente");
		}
		
		Long parametroId= (Long)miSessionFactory.getCurrentSession().save(parametro);
		return parametroId;
		
	}

	@Override
	public void remove(Parametro parametro) {
		
		miSessionFactory.getCurrentSession().delete(parametro);
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Parametro> findAll() {
		
		Query query= miSessionFactory.getCurrentSession().
				createQuery("FROM Parametro");
		
		
		List<Parametro> parametros= query.list();
		
		return parametros;
	}
	
	

}
