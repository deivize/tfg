package es.udc.fi.tfg.daos;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import es.udc.fi.tfg.model.Etiqueta;

@Repository
public class EtiquetaDAOHibImpl implements EtiquetaDAO {
	
	@Autowired
	private SessionFactory miSessionFactory;

	@Override
	public Long create(Etiqueta etiqueta) {
		
		if(etiqueta.getIdEtiqueta()!=null){
			throw new RuntimeException("Intento de creacion de etiqueta ya persistente");
		}
		
		Long etiquetaId= (Long)miSessionFactory.getCurrentSession().save(etiqueta);
		return etiquetaId;
		
	}

	@Override
	public List<Etiqueta> findAll() {
		List<Etiqueta> etiquetas= (List<Etiqueta>) miSessionFactory.getCurrentSession().
				createQuery("FROM Etiqueta").list();
				
		return etiquetas;
	}

	@Override
	public Etiqueta findById(Long id){
		Query query= miSessionFactory.getCurrentSession().
				createQuery("FROM Etiqueta WHERE idEtiqueta= :id");
		query.setParameter("id", id);
		
		Etiqueta etiqueta= (Etiqueta) query.uniqueResult();
		
		return etiqueta;
		
	}
	
	
	@Override
	public void update(Etiqueta etiqueta) {
		
		miSessionFactory.getCurrentSession().update(etiqueta);
	}

	@Override
	public void remove(Etiqueta etiqueta) {
		
		miSessionFactory.getCurrentSession().delete(etiqueta);
		
	}
	
	
	

}
