package vn.com.luanvan.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import vn.com.luanvan.dao.LopDao;
import vn.com.luanvan.model.Lop;

@Service
@Transactional
public class LopServiceImpl implements LopDao{

	@Autowired
	private LopDao lopDao;
	
	@Override
	public boolean saveLop(Lop lop) {
		return lopDao.saveLop(lop);
	}

	@Override
	public boolean updateLop(Lop lop) {
		return lopDao.updateLop(lop);
	}

	@Override
	public boolean deleteLop(long id) {
		return lopDao.deleteLop(id);
	}

	@Override
	public List<Lop> findAllLop() {
		return lopDao.findAllLop();
	}

	@Override
	public Lop findLopById(long Id) {
		return lopDao.findLopById(Id);
	}

}
