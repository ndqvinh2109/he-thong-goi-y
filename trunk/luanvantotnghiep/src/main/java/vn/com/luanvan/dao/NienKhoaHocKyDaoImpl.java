package vn.com.luanvan.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vn.com.luanvan.model.NienKhoaHocKy;

@Repository
public class NienKhoaHocKyDaoImpl implements NienKhoaHocKyDao{

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public boolean saveNienKhoaHocKy(NienKhoaHocKy nienKhoaHocKy) {
		try {
			Session session = sessionFactory.getCurrentSession();
			session.save(nienKhoaHocKy);
			return true;
		} catch (HibernateException e) {
			return false;
		}
	}

	@Override
	public boolean updateNienKhoaHocKy(NienKhoaHocKy nienKhoaHocKy) {
		try {
			Session session = sessionFactory.getCurrentSession();
			session.update(nienKhoaHocKy);
			return true;
		} catch (HibernateException e) {
			return false;
		}
	}

	@Override
	public boolean deleteNienKhoaHocKy(long id) {
		try {
			NienKhoaHocKy nienKhoaHocKy = (NienKhoaHocKy) sessionFactory.getCurrentSession().load(NienKhoaHocKy.class, id);
			if(nienKhoaHocKy != null){
				sessionFactory.getCurrentSession().delete(nienKhoaHocKy);
			}
			return true;
		} catch (HibernateException e) {
			return false;
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<NienKhoaHocKy> findAllNienKhoaHocKy() {
		try {
			Criteria criteria = sessionFactory.getCurrentSession().createCriteria(NienKhoaHocKy.class);
			criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
			criteria.addOrder(Order.asc("nienkhoaId"));
			List<NienKhoaHocKy> list = criteria.list();
			return list;
		} catch (HibernateException e) {
			return null;
		}
	}

	@Override
	public NienKhoaHocKy findNienKhoaHocKyById(long Id) {
		try {
			NienKhoaHocKy nienKhoaHocKy = (NienKhoaHocKy) sessionFactory.getCurrentSession().load(NienKhoaHocKy.class, Id);
			return nienKhoaHocKy;
		} catch (HibernateException e) {
			return null;
		}
	}

}
