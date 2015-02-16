package es.udc.fi.tfg.daos;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import es.udc.fi.tfg.model.Tecnologia;

@Repository
public class TecnologiaDAOHibImpl implements TecnologiaDAO {
	
	@Autowired
	private SessionFactory miSessionFactory;

	@Override
	public Long create(Tecnologia tecnologia) {
		
		if(tecnologia.getIdTecnologia()!=null){
			throw new RuntimeException("Intento de creacion de tecnologia ya persistente");
		}
		
		Long tecnologiaId= (Long)miSessionFactory.getCurrentSession().save(tecnologia);
		return tecnologiaId;
		
	}

	@Override
	public void remove(Tecnologia tecnologia) {
		
		miSessionFactory.getCurrentSession().delete(tecnologia);
		
	}
	
	

}
