package vn.com.luanvan.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import vn.com.luanvan.dao.NganhDao;
import vn.com.luanvan.model.Nganh;

@Service
@Transactional
public class NganhServiceImpl implements NganhService{
	
	@Autowired
	private NganhDao nganhDao;

	@Override
	public boolean saveNganh(Nganh nganh) {
		return nganhDao.saveNganh(nganh);
	}

	@Override
	public boolean updateNganh(Nganh nganh) {		
		return nganhDao.updateNganh(nganh);
	}

	@Override
	public boolean deleteNganh(long id) {		
		return nganhDao.deleteNganh(id);
	}

	@Override
	public List<Nganh> findAllNganh() {		
		return nganhDao.findAllNganh();
	}

	@Override
	public Nganh findNganhById(long Id) {		
		return nganhDao.findNganhById(Id);
	}

	@Override
	public Nganh findNganhBySinhVienId(long sinhVienId) {
		return nganhDao.findNganhBySinhVienId(sinhVienId);
	}

}
