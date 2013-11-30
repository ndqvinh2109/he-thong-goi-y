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

import vn.com.luanvan.model.ChuongTrinhDaoTao;

@Repository
public class ChuongTrinhDaoTaoDaoImpl implements ChuongTrinhDaoTaoDao{
	
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public boolean saveChuongTrinhDaoTao(ChuongTrinhDaoTao chuongTrinhDaoTao) {
		try {
			Session session = sessionFactory.getCurrentSession();
			session.save(chuongTrinhDaoTao);
			return true;
		} catch (HibernateException e) {
			e.printStackTrace();
			return false;
		}
		
	}

	@Override
	public boolean updateChuongTrinhDaoTao(ChuongTrinhDaoTao chuongTrinhDaoTao) {
		try {
			Session session = sessionFactory.getCurrentSession();
			session.update(chuongTrinhDaoTao);
			return true;
		} catch (HibernateException e) {
			return false;
		}
	}

	@Override
	public boolean deleteChuongTrinhDaoTao(long id) {
		try {
			ChuongTrinhDaoTao chuongTrinhDaoTao = (ChuongTrinhDaoTao) sessionFactory.getCurrentSession().load(ChuongTrinhDaoTao.class, id);
			if(chuongTrinhDaoTao != null){
				sessionFactory.getCurrentSession().delete(chuongTrinhDaoTao);
			}
			return true;
		} catch (HibernateException e) {
			return false;
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ChuongTrinhDaoTao> findAllChuongTrinhDaoTao() {
		try {
			Criteria criteria = sessionFactory.getCurrentSession().createCriteria(ChuongTrinhDaoTao.class);
			criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
			criteria.addOrder(Order.asc("chuongTrinhDaoTaoId"));
			List<ChuongTrinhDaoTao> list = criteria.list();
			return list;
		} catch (HibernateException e) {
			return null;
		}
	}

	@Override
	public ChuongTrinhDaoTao findChuongTrinhDaoTaoById(long Id) {
		try {
			ChuongTrinhDaoTao chuongTrinhDaoTao = (ChuongTrinhDaoTao) sessionFactory.getCurrentSession().load(ChuongTrinhDaoTao.class, Id);
			return chuongTrinhDaoTao;
		} catch (HibernateException e) {
			return null;
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public String findSoTinChiTuChonByNhomTuChon(String nhomTuChon) {
		try {
			Session session = sessionFactory.getCurrentSession();
			String hql = "select ctdt.tuChon "
					+ "from ChuongTrinhDaoTao ctdt "
					+ "where ctdt.nhomTuChon = :nhomTuChon";
			Query query = session.createQuery(hql);
			query.setString("nhomTuChon", nhomTuChon);
			List<String> list = query.list();
			System.out.println(list);
			if(list != null && list.size() != 0)
				return list.get(0);
			else
				return "0";
		} catch (HibernateException e) {
			return null;
		}
	}
	
	
}
