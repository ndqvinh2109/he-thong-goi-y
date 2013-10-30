package vn.com.luanvan.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vn.com.luanvan.model.KhoaDaoTao;

@Repository
public class KhoaDaoTaoDaoImpl implements KhoaDaoTaoDao{
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public boolean saveKhoaDaoTao(KhoaDaoTao khoaDaoTao) {
		try {
			Session session = sessionFactory.getCurrentSession();
			session.save(khoaDaoTao);
			return true;
		} catch (HibernateException e) {
			return false;
		}
	}

	@Override
	public boolean updateKhoaDaoTao(KhoaDaoTao khoaDaoTao) {
		try {
			Session session = sessionFactory.getCurrentSession();
			session.update(khoaDaoTao);
			return true;
		} catch (HibernateException e) {
			return false;
		}
	}

	@Override
	public boolean deleteKhoaDaoTao(long id) {
		try {
			KhoaDaoTao khoaDaoTao = (KhoaDaoTao) sessionFactory.getCurrentSession().load(KhoaDaoTao.class, id);
			if(khoaDaoTao != null){
				sessionFactory.getCurrentSession().delete(khoaDaoTao);
			}
			return true;
		} catch (HibernateException e) {
			return false;
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<KhoaDaoTao> findAllKhoaDaoTao() {
		try {
			Criteria criteria = sessionFactory.getCurrentSession().createCriteria(KhoaDaoTao.class);
			criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
			criteria.addOrder(Order.asc("khoaDaoTaoId"));
			List<KhoaDaoTao> list = criteria.list();
			return list;
		} catch (HibernateException e) {
			return null;
		}
	}

	@Override
	public KhoaDaoTao findKhoaDaoTaoById(long id) {
		try {
			KhoaDaoTao khoaDaoTao = (KhoaDaoTao) sessionFactory.getCurrentSession().load(KhoaDaoTao.class, id);
			return khoaDaoTao;
		} catch (HibernateException e) {
			return null;
		}
	}
}
