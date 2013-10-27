package vn.com.luanvan.service;

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
	public boolean saveKhoaChuQuan(KhoaChuQuan kcq) {
		return khoaChuQuanDao.saveKhoaChuQuan(kcq);
	}

}
