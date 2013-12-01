package vn.com.luanvan.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Hibernate;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vn.com.luanvan.model.Nganh;

@Repository
public class NganhDaoImpl implements NganhDao{
	
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public boolean saveNganh(Nganh nganh) {
		try {
			Session session = sessionFactory.getCurrentSession();
			session.save(nganh);
			return true;
		} catch (HibernateException e) {
			return false;
		}
	}

	@Override
	public boolean updateNganh(Nganh nganh) {
		try {
			Session session = sessionFactory.getCurrentSession();
			session.update(nganh);
			return true;
		} catch (HibernateException e) {
			return false;			
		}
	}

	@Override
	public boolean deleteNganh(long id) {
		try {
			Nganh nganh = (Nganh) sessionFactory.getCurrentSession().load(Nganh.class, id);
			if(nganh !=null){
				sessionFactory.getCurrentSession().delete(nganh);
			}		
			return true;
		} catch (HibernateException e) {
			return false;
		}
	}

	@SuppressWarnings("unchecked")
	
	@Override
	public List<Nganh> findAllNganh() {
		try {
			Criteria criteria = sessionFactory.getCurrentSession().createCriteria(Nganh.class);
			criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
			criteria.addOrder(Order.asc("nganhId"));
			List<Nganh> list = criteria.list();
			return list;
		} catch (HibernateException e) {
			return null;
		}
	}

	@Override
	public Nganh findNganhById(long Id) {
		try {
			Nganh nganh = (Nganh) sessionFactory.getCurrentSession().load(Nganh.class, Id);
			Hibernate.initialize(nganh);
			return nganh;
		} catch (HibernateException e) {
			return null;
		}
	}

	@Override
	public Nganh findNganhBySinhVienId(long sinhVienId) {
		try {
			Session session = sessionFactory.getCurrentSession();
			String hql = "select ng "
					+ "from SinhVien sv "
					+ "inner join sv.lop l "
					+ "inner join l.nganh ng "
					+ "where sv.sinhVienId = :sinhVienId";
			Query query = session.createQuery(hql);
			query.setLong("sinhVienId", sinhVienId);
			Nganh nganh = (Nganh) query.uniqueResult();
			return nganh;
			
		} catch (HibernateException e) {
			return null;
		}
	}

}
