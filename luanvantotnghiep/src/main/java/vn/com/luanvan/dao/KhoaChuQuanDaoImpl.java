package vn.com.luanvan.dao;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vn.com.luanvan.model.KhoaChuQuan;

@Repository
public class KhoaChuQuanDaoImpl implements KhoaChuQuanDao{

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public boolean saveKhoaChuQuan(KhoaChuQuan kcq) {
		try {
			Session session = sessionFactory.getCurrentSession();
			session.save(kcq);
			return true;
		} catch (HibernateException e) {
			return false;
		}
	}
}
