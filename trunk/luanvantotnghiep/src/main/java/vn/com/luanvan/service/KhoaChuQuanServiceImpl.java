package vn.com.luanvan.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import vn.com.luanvan.dao.KhoaChuQuanDao;
import vn.com.luanvan.model.KhoaChuQuan;

@Service
@Transactional
public class KhoaChuQuanServiceImpl implements KhoaChuQuanService{

	@Autowired
	private KhoaChuQuanDao khoaChuQuanDao;
	
	@Override
	public boolean saveKhoaChuQuan(KhoaChuQuan khoaChuQuan) {
		return khoaChuQuanDao.saveKhoaChuQuan(khoaChuQuan);
	}

	@Override
	public boolean updateKhoaChuQuan(KhoaChuQuan khoaChuQuan) {
		
		return khoaChuQuanDao.updateKhoaChuQuan(khoaChuQuan);
	}

	@Override
	public boolean deleteKhoaChuQuan(long id) {
		
		return khoaChuQuanDao.deleteKhoaChuQuan(id);
	}

	@Override
	public List<KhoaChuQuan> findAllKhoaChuQuan() {
		
		return khoaChuQuanDao.findAllKhoaChuQuan();
	}

	@Override
	public KhoaChuQuan findKhoaChuQuanById(long Id) {
		
		return khoaChuQuanDao.findKhoaChuQuanById(Id);
	}

}
