package vn.com.luanvan.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import vn.com.luanvan.dao.HocPhanTienQuyetDao;
import vn.com.luanvan.model.HocPhanTienQuyet;

public class HocPhanTienQuyetServiceImpl implements HocPhanTienQuyetService{
	
	@Autowired
	private HocPhanTienQuyetDao hocPhanTienQuyetDao;

	@Override
	public boolean saveHocPhanTienQuyet(HocPhanTienQuyet hocPhanTienQuyet) {
		return hocPhanTienQuyetDao.saveHocPhanTienQuyet(hocPhanTienQuyet);
	}

	@Override
	public boolean updateHocPhanTienQuyet(HocPhanTienQuyet hocPhanTienQuyet) { 
		return hocPhanTienQuyetDao.updateHocPhanTienQuyet(hocPhanTienQuyet);
	}

	@Override
	public boolean deleteHocPhanTienQuyet(long id) {
		return hocPhanTienQuyetDao.deleteHocPhanTienQuyet(id);
	}

	@Override
	public List<HocPhanTienQuyet> findAllHocPhanTienQuyet() {
		return hocPhanTienQuyetDao.findAllHocPhanTienQuyet();
	}

	@Override
	public HocPhanTienQuyet findHocPhanTienQuyetById(long Id) {
		return hocPhanTienQuyetDao.findHocPhanTienQuyetById(Id);
	}

}
