package es.udc.fi.tfg.daos;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import es.udc.fi.tfg.model.Lector;
import es.udc.fi.tfg.model.LectorLocalizacion;

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
	public Lector findById(Long id){
		Query query= miSessionFactory.getCurrentSession().
				createQuery("FROM Lector WHERE idLector= :id");
		query.setParameter("id", id);
		
		Lector lector= (Lector) query.uniqueResult();
		
		return lector;
	}

	@Override
	public void update(Lector lector) {

		miSessionFactory.getCurrentSession().update(lector);
		
	}

	@Override
	public void remove(Lector lector) {
		
		miSessionFactory.getCurrentSession().delete(lector);
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Lector> buscarLectores(String tipo, String modelo) {
		
		List<Lector> lectores= new ArrayList<Lector>();
		
		String query="FROM Lector ";
		
		if(tipo!=null && modelo!=null){
			
			query= query + " WHERE tipo= :tipo AND modelo= :modelo";
			
		}else if(tipo!=null && modelo==null){
			query=query + " WHERE tipo= :tipo";
		}else if(tipo==null && modelo!=null){
			query=query+" WHERE modelo= :modelo";
		}
		
		
		Query consulta= miSessionFactory.getCurrentSession().createQuery(query);
		if(tipo!=null){
			consulta.setParameter("tipo", tipo);
		}
		if(modelo!=null){
			consulta.setParameter("modelo", modelo);
		}
		
		lectores=consulta.list();
		
		
		return lectores;
	}
	
	

}
