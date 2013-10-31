package vn.com.luanvan.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vn.com.luanvan.model.HocPhanTienQuyet;

@Repository
public class HocPhanTienQuyetDaoImpl implements HocPhanTienQuyetDao{
	
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public boolean saveHocPhanTienQuyet(HocPhanTienQuyet hocPhanTienQuyet) {
		try {
			Session session = sessionFactory.getCurrentSession();
			session.save(hocPhanTienQuyet);
			return true;
		} catch (HibernateException e) {
			return false;
		}
	}

	@Override
	public boolean updateHocPhanTienQuyet(HocPhanTienQuyet hocPhanTienQuyet) {
		try {
			Session session = sessionFactory.getCurrentSession();
			session.update(hocPhanTienQuyet);
			return true;
		} catch (HibernateException e) {
			return false;
		}
	}

	@Override
	public boolean deleteHocPhanTienQuyet(long id) {
		try {
			HocPhanTienQuyet hocPhanTienQuyet = (HocPhanTienQuyet) sessionFactory.getCurrentSession().load(HocPhanTienQuyet.class, id);
			if(hocPhanTienQuyet != null){
				sessionFactory.getCurrentSession().delete(hocPhanTienQuyet);
			}
			return true;
		} catch (HibernateException e) {
			return false;
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<HocPhanTienQuyet> findAllHocPhanTienQuyet() {
		try {
			Criteria criteria = sessionFactory.getCurrentSession().createCriteria(HocPhanTienQuyet.class);
			criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
			criteria.addOrder(Order.asc("hocPhanTienQuyetId"));
			List<HocPhanTienQuyet> list = criteria.list();
			return list;
		} catch (HibernateException e) {
			return null;
		}
	}

	@Override
	public HocPhanTienQuyet findHocPhanTienQuyetById(long Id) {
		HocPhanTienQuyet hocPhanTienQuyet = (HocPhanTienQuyet) sessionFactory.getCurrentSession().load(HocPhanTienQuyet.class, Id);
		return hocPhanTienQuyet;
		
	}

	
}
