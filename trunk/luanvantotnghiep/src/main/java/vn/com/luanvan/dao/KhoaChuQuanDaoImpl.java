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
import vn.com.luanvan.model.KhoaChuQuan;

@Repository
public class KhoaChuQuanDaoImpl implements KhoaChuQuanDao{

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public boolean saveKhoaChuQuan(KhoaChuQuan khoaChuQuan) {
		try {
			Session session = sessionFactory.getCurrentSession();
			session.save(khoaChuQuan);
			return true;
		} catch (HibernateException e) {
			return false;
		}
	}

	@Override
	public boolean updateKhoaChuQuan(KhoaChuQuan khoaChuQuan) {
		try {
			Session session = sessionFactory.getCurrentSession();
			session.update(khoaChuQuan);
			return true;
		} catch (HibernateException e) {
			return false;
		}
	}

	@Override
	public boolean deleteKhoaChuQuan(long id) {
		try {
			KhoaChuQuan khoaChuQuan = (KhoaChuQuan) sessionFactory.getCurrentSession().load(KhoaChuQuan.class, id);
			if(khoaChuQuan != null){
			sessionFactory.getCurrentSession().delete(khoaChuQuan);
			}
			return true;
		} catch (HibernateException e) {
			return false;
		}
	}

	@Override
	public List<KhoaChuQuan> findAllKhoaChuQuan() {
		try {
			Criteria criteria = sessionFactory.getCurrentSession().createCriteria(KhoaChuQuan.class);
			criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
			criteria.addOrder(Order.asc("khoaChuQuanId"));
			List<KhoaChuQuan> list = criteria.list();
			return list;
		} catch (HibernateException e) {
			return null;
		}
	}

	@Override
	public KhoaChuQuan findKhoaChuQuanById(long Id) {
		try {
			KhoaChuQuan khoaChuQuan = (KhoaChuQuan) sessionFactory.getCurrentSession().load(KhoaChuQuan.class, Id);
			return khoaChuQuan;
		} catch (HibernateException e) {
			return null;
		}
	}
}
