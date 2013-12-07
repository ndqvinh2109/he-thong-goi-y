package vn.com.luanvan.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vn.com.luanvan.model.BoMon;
import vn.com.luanvan.model.HocPhan;
import vn.com.luanvan.model.HocPhanTienQuyet;

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

	@SuppressWarnings("unchecked")
	@Override
	public List<Object[]> findHocPhanByNganhIdAndKhoaDaoTaoId(long nganhId,
			long khoaDaoTaoId) {
		try {
			Session session = sessionFactory.getCurrentSession();
			String hql = "select hp, ctdt "
					+ "from ChuongTrinhDaoTao ctdt "
					+ "inner join ctdt.khoaDaoTao kdt "
					+ "inner join ctdt.nganh ng "
					+ "inner join ctdt.hocPhan hp "
					+ "where kdt.khoaDaoTaoId = :khoaDaoTaoId "
					+ "and ng.nganhId = :nganhId "
					+ "order by cast(ctdt.nhomTuChon as integer) asc";
			Query query = session.createQuery(hql);
			query.setLong("khoaDaoTaoId", khoaDaoTaoId);
			query.setLong("nganhId", nganhId);
			List<Object[]> list = query.list();
			return list;
		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}
	

	@SuppressWarnings("unchecked")
	@Override
	public List<HocPhanTienQuyet> findHocPhanTienQuyetByHocPhanId(long hocPhanId) {
		try {
			Session session = sessionFactory.getCurrentSession();
			String hql = "select hptq "
					+ "from HocPhan hp inner join "
					+ "hp.hocPhanTienQuyets hptq "
					+ "where hp.hocPhanId = :hocPhanId";
			Query query = session.createQuery(hql);
			query.setLong("hocPhanId", hocPhanId);
			List<HocPhanTienQuyet> list = query.list();
			return list;
		} catch (HibernateException e) {
			return null;
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<String> findNhomTuChonByHocPhanId(long hocPhanId) {
		try {
			Session session =  sessionFactory.getCurrentSession();
			String hql = "select ctdt.nhomTuChon "
					+ "from HocPhan hp inner join "
					+ "hp.chuongTrinhs ctdt "
					+ "where ctdt.nhomTuChon = ("
													+ "select ctdt.nhomTuChon "
													+ "from HocPhan hp inner join "
													+ "hp.chuongTrinhs ctdt "
													+ "where hp.hocPhanId = :hocPhanId)";
			Query query = session.createQuery(hql);
			query.setLong("hocPhanId", hocPhanId);
			List<String> list = query.list();
			return list;
		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Object[]> findHocPhanBySinhVienIdAndNienKhoaId(long sinhVienId) {
		try {
			Session session = sessionFactory.getCurrentSession();
			String hql = "select hp, diem, nkhk "
					+ "from Diem diem "
					+ "inner join diem.nienKhoaHocKy nkhk "
					+ "inner join diem.sinhvien sv "
					+ "inner join diem.hocPhan hp "
					+ "where sv.sinhVienId = :sinhVienId "
					+ "order by cast(substring(nkhk.namHoc, 1, 4) as integer) asc, "
					+ "cast(nkhk.hocKy as integer) asc";
			Query query = session.createQuery(hql);
			query.setLong("sinhVienId", sinhVienId);
			List<Object[]> list = query.list();
			return list;
		} catch (HibernateException e) {
			return null;
		}
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Object[]> findHocPhanByNganhIdAndKhoaDaoTaoKHHTId(long nganhId,
			long khoaDaoTaoId) {
		
		try {
			Session session = sessionFactory.getCurrentSession();
			String hql = "select hp, ctdt "
					+ "from ChuongTrinhDaoTao ctdt "
					+ "inner join ctdt.khoaDaoTao kdt "
					+ "inner join ctdt.nganh ng "
					+ "inner join ctdt.hocPhan hp "
					+ "where kdt.khoaDaoTaoId = :khoaDaoTaoId "
					+ "and ng.nganhId = :nganhId "
					+ "order by cast(ctdt.hocKyMacDinh as integer) asc, cast(ctdt.nhomTuChon as integer) asc";
			Query query = session.createQuery(hql);
			query.setLong("khoaDaoTaoId", khoaDaoTaoId);
			query.setLong("nganhId", nganhId);
			List<Object[]> list = query.list();
			return list;
		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public HocPhan findHocPhanByMaHocPhan(String maHocPhan) {
		try {
			String maHP = maHocPhan.toUpperCase().trim();
			Criteria criteria = sessionFactory.getCurrentSession().createCriteria(HocPhan.class);
			criteria.add(Restrictions.eq("maHP", maHP));
			HocPhan hocphan = (HocPhan) criteria.uniqueResult();
			return hocphan;
		} catch (HibernateException e) {
			return null;
		}
	}
}
