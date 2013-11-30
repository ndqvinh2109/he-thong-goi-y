package vn.com.luanvan.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
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
			Session session = sessionFactory.getCurrentSession();
			String hql="select sv "
					+ "from SinhVien sv "
					+ "where sv.sinhVienId = :sinhVienId";
			Query query = session.createQuery(hql);
			query.setLong("sinhVienId", Id);		
			SinhVien sinhVien = (SinhVien) query.uniqueResult();
			return sinhVien;
		} catch (HibernateException e) {
			return null;
		}		
	}

	
	@SuppressWarnings("unchecked")
	@Override
	public List<Object[]> findDiemCuaSinhVien(){
		try {
			Session session = sessionFactory.getCurrentSession();
			String hql = "select";
			Query query = session.createQuery(hql);
			List<Object[]> list = query.list();
			return list;
		} catch (HibernateException e) {
			return null;
		}
	}

	@Override
	public SinhVien findSinhVienByMaSinhVien(String maSinhVien) {
		try {
			String maSV = maSinhVien.trim();
			Session session = sessionFactory.getCurrentSession();
			String hql = "select sv "
					+ "from SinhVien sv "
					+ "where trim(sv.maSoSinhVien) = :maSinhVien";
			Query query = session.createQuery(hql);
			query.setString("maSinhVien", maSV);
			SinhVien sinhVien = (SinhVien) query.uniqueResult();
			return sinhVien;
		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}
}
