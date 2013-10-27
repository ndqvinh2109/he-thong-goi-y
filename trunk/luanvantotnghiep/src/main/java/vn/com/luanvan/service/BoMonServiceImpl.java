package vn.com.luanvan.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import vn.com.luanvan.dao.BoMonDao;
import vn.com.luanvan.model.BoMon;

@Service
@Transactional
public class BoMonServiceImpl implements BoMonService{

	@Autowired
	private BoMonDao boMonDao;
	
	@Override
	public boolean saveBoMon(BoMon boMon) {
		return boMonDao.saveBoMon(boMon);
	}

	@Override
	public boolean updateBoMon(BoMon boMon) {
		return boMonDao.updateBoMon(boMon);
	}

	@Override
	public boolean deleteBoMon(long id) {
		return boMonDao.deleteBoMon(id);
	}

	@Override
	public List<BoMon> findAllBoMon() {
		return boMonDao.findAllBoMon();
	}

	@Override
	public BoMon findBoMonById(long Id) {
		return boMonDao.findBoMonById(Id);
	}

}
