package vn.com.luanvan.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vn.com.luanvan.model.BoMon;

@Repository
public class BoMonDaoImpl implements BoMonDao{

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public boolean saveBoMon(BoMon boMon) {
		try {
			Session session = sessionFactory.getCurrentSession();
			session.save(boMon);
			return true;
		} catch (HibernateException e) {
			return false;
		}
	}

	@Override
	public boolean updateBoMon(BoMon boMon) {
		try {
			Session session = sessionFactory.getCurrentSession();
			session.update(boMon);
			return true;
		} catch (HibernateException e) {
			return false;
		}
	}

	@Override
	public boolean deleteBoMon(long id) {
		try {
			BoMon boMon = (BoMon) sessionFactory.getCurrentSession().load(BoMon.class, id);
			if(boMon != null){
				sessionFactory.getCurrentSession().delete(boMon);
			}
			return true;
		} catch (HibernateException e) {
			return false;
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<BoMon> findAllBoMon() {
		try {
			Criteria criteria = sessionFactory.getCurrentSession().createCriteria(BoMon.class);
			criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
			criteria.addOrder(Order.asc("boMonId"));
			List<BoMon> list = criteria.list();
			return list;
		} catch (HibernateException e) {
			return null;
		}
	}

	@Override
	public BoMon findBoMonById(long Id) {
		try {
			BoMon boMon = (BoMon) sessionFactory.getCurrentSession().load(BoMon.class, Id);
			return boMon;
		} catch (HibernateException e) {
			return null;
		}
	}

}
