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
import vn.com.luanvan.model.HocPhan;

@Repository
public class HocPhanImpl implements HocPhanDao{
	
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public boolean saveHocPhan(HocPhan hocPhan) {
		try {
			Session session = sessionFactory.getCurrentSession();
			session.save(hocPhan);
			return true;
		} catch (HibernateException e) {
			return false;
		}
	}

	@Override
	public boolean updateHocPhan(HocPhan hocPhan) {
		try {
			Session session = sessionFactory.getCurrentSession();
			session.update(hocPhan);
			return true;
		} catch (HibernateException e) {
			return false;
		}
	}

	@Override
	public boolean deleteHocPhan(long id) {
		try {
			HocPhan hocPhan = (HocPhan) sessionFactory.getCurrentSession().load(BoMon.class, id);
			if (hocPhan != null){
				sessionFactory.getCurrentSession().delete(hocPhan);
			}
			return true;
		} catch (HibernateException e) {
			return false;
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<HocPhan> findAllHocPhan() {
		try {
			Criteria criteria = sessionFactory.getCurrentSession().createCriteria(HocPhan.class);
			criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
			criteria.addOrder(Order.asc("hocPhanId"));
			List<HocPhan> list = criteria.list();
			return list;
		} catch (HibernateException e) {
			return null;
		}
}

	@Override
	public HocPhan findHocPhanById(long Id) {
		try {
			HocPhan hocPhan = (HocPhan) sessionFactory.getCurrentSession().load(HocPhan.class, Id);
			return hocPhan;
		} catch (HibernateException e) {
			return null;
		}
	}

}
