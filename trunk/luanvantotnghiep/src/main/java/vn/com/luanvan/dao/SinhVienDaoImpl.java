package vn.com.luanvan.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vn.com.luanvan.model.SinhVien;

@Repository
public class SinhVienDaoImpl implements SinhVienDao{

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public boolean saveSinhVien(SinhVien sinhVien) {
		try {
			Session session = sessionFactory.getCurrentSession();
			session.save(sinhVien);
			return true;
		} catch (HibernateException e) {
			return false;
		}
	}

	@Override
	public boolean updateSinhVien(SinhVien sinhVien) {
		try {
			Session session = sessionFactory.getCurrentSession();
			session.save(sinhVien);
			return true;
		} catch (HibernateException e) {
			return false;
		}
	}

	@Override
	public boolean deleteSinhVien(long id) {
		try {
			SinhVien sinhVien = (SinhVien) sessionFactory.getCurrentSession().load(SinhVien.class, id);
			if(sinhVien != null){
				sessionFactory.getCurrentSession().delete(sinhVien);
			}
			return true;
		} catch (HibernateException e) {
			return false;
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<SinhVien> findAllSinhVien() {
		try {
			Criteria criteria = sessionFactory.getCurrentSession().createCriteria(SinhVien.class);
			criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
			criteria.addOrder(Order.asc("sinhVienId"));
			List<SinhVien> list = criteria.list();
			return list;
		} catch (HibernateException e) {
			return null;
		}
	}

	@Override
	public SinhVien findSinhVienById(long Id) {
		try {
			SinhVien sinhVien = (SinhVien) sessionFactory.getCurrentSession().load(SinhVien.class, Id);
			return sinhVien;
		} catch (HibernateException e) {
			return null;
		}
	}

}
