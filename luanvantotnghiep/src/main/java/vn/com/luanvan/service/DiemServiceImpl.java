package vn.com.luanvan.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import vn.com.luanvan.dao.DiemDao;
import vn.com.luanvan.model.Diem;

@Service
@Transactional
public class DiemServiceImpl implements DiemService{

	@Autowired
	private DiemDao diemDao;
	
	@Override
	public boolean saveDiem(Diem diem) {
		return diemDao.saveDiem(diem);
	}

	@Override
	public boolean updateDiem(Diem diem) {
		return diemDao.updateDiem(diem);
	}

	@Override
	public boolean deleteDiem(long id) {
		return diemDao.deleteDiem(id);
	}

	@Override
	public List<Diem> findAllDiem() {
		return diemDao.findAllDiem();
	}

	@Override
	public Diem findDiemById(long Id) {
		return diemDao.findDiemById(Id);
	}

}
