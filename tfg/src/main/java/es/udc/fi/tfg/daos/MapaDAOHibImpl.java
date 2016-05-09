package es.udc.fi.tfg.daos;



import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import es.udc.fi.tfg.model.Mapa;

@Repository
public class MapaDAOHibImpl implements MapaDAO {

	@Autowired
	private SessionFactory miSessionFactory;
	
	
	@Override
	public Long create(Mapa mapa) {
		
		if(mapa.getIdMapa()!=null){
			throw new RuntimeException("Intento de creacion de mapa ya persistente");
		}
		
		Long mapaId=(Long) miSessionFactory.getCurrentSession().save(mapa);
		
		return mapaId;
	}

	@Override
	public void update(Mapa mapa) {
		miSessionFactory.getCurrentSession().update(mapa);
		
	}

	@Override
	public void remove(Mapa mapa) {
		miSessionFactory.getCurrentSession().delete(mapa);
		
	}

	@Override
	public Mapa getMapaActivo() {
		
		Mapa mapa=null;
		
		Query query= miSessionFactory.getCurrentSession().createQuery("FROM Mapa where activo=TRUE");
		
		return (Mapa) query.uniqueResult();
	}

	@Override
	public Mapa getMapaByNombre(String nombre) {
		
		Mapa mapa=null;
		
		Query query= miSessionFactory.getCurrentSession().createQuery("FROM Mapa WHERE nombre=:name ");
		query.setParameter("name", nombre);
		mapa= (Mapa) query.uniqueResult();
		
		
		return mapa;
	}

}
