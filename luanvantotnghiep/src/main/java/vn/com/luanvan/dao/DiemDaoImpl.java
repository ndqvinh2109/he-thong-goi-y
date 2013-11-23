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

import vn.com.luanvan.model.BoMon;
import vn.com.luanvan.model.Diem;

@Repository
public class DiemDaoImpl implements DiemDao{

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public boolean saveDiem(Diem diem) {
		try {
			Session session = sessionFactory.getCurrentSession();
			session.save(diem);
			return true;
		} catch (HibernateException e) {
			return false;
		}
	}

	@Override
	public boolean updateDiem(Diem diem) {
		try {
			Session session = sessionFactory.getCurrentSession();
			session.update(diem);
			return true;
		} catch (HibernateException e) {
			return false;
		}
	}

	@Override
	public boolean deleteDiem(long id) {
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
	public List<Diem> findAllDiem() {
		try {
			Criteria criteria = sessionFactory.getCurrentSession().createCriteria(Diem.class);
			criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
			criteria.addOrder(Order.asc("diemId"));
			List<Diem> list = criteria.list();
			return list;
		} catch (HibernateException e) {
			return null;
		}
	}

	@Override
	public Diem findDiemById(long Id) {
		try {
			Diem diem = (Diem) sessionFactory.getCurrentSession().load(Diem.class, Id);
			return diem;
		} catch (HibernateException e) {
			return null;
		}
	}

	@Override
	public int updateDiemByDiemIdAndHocPhanIdAndSinhVienId(long diemId, String diemDuDoan) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "update Diem d set d.diemDuDoan = :diemDuDoan " +
						"where d.diemId = :diemId";
		Query query = session.createQuery(hql);
		query.setParameter("diemId", diemId);
		query.setParameter("diemDuDoan", diemDuDoan);
		int result = query.executeUpdate();
		return result;
	}
}
