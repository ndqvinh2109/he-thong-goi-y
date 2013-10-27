package vn.com.luanvan.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vn.com.luanvan.model.Lop;

@Repository
public class LopDaoImpl implements LopDao{

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public boolean saveLop(Lop lop) {
		try {
			Session session = sessionFactory.getCurrentSession();
			session.save(lop);
			return true;
		} catch (HibernateException e) {
			return false;
		}
	}

	@Override
	public boolean updateLop(Lop lop) {
		try {
			Session session = sessionFactory.getCurrentSession();
			session.update(lop);
			return true;
		} catch (HibernateException e) {
			return false;
		}
	}

	@Override
	public boolean deleteLop(long id) {
		try {
			Lop lop = (Lop) sessionFactory.getCurrentSession().load(Lop.class, id);
			if(lop != null){
				sessionFactory.getCurrentSession().delete(lop);
			}
			return true;
		} catch (HibernateException e) {
			return false;
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Lop> findAllLop() {
		try {
			Criteria criteria = sessionFactory.getCurrentSession().createCriteria(Lop.class);
			criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
			criteria.addOrder(Order.asc("lopId"));
			List<Lop> list = criteria.list();
			return list;
		} catch (HibernateException e) {
			return null;
		}
	}

	@Override
	public Lop findLopById(long Id) {
		try {
			Lop lop = (Lop) sessionFactory.getCurrentSession().load(Lop.class, Id);
			return lop;
		} catch (HibernateException e) {
			return null;
		}
	}
	
	

}
