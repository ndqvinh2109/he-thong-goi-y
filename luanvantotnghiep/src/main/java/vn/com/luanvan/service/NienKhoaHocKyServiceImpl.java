package vn.com.luanvan.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import vn.com.luanvan.dao.NienKhoaHocKyDao;
import vn.com.luanvan.model.NienKhoaHocKy;

@Service
@Transactional
public class NienKhoaHocKyServiceImpl implements NienKhoaHocKyService{

	@Autowired
	private NienKhoaHocKyDao nienKhoaHocKyDao;
	
	@Override
	public boolean saveNienKhoaHocKy(NienKhoaHocKy nienKhoaHocKy) {
		return nienKhoaHocKyDao.saveNienKhoaHocKy(nienKhoaHocKy);
	}

	@Override
	public boolean updateNienKhoaHocKy(NienKhoaHocKy nienKhoaHocKy) {
		return nienKhoaHocKyDao.updateNienKhoaHocKy(nienKhoaHocKy);
	}

	@Override
	public boolean deleteNienKhoaHocKy(long id) {
		return nienKhoaHocKyDao.deleteNienKhoaHocKy(id);
	}

	@Override
	public List<NienKhoaHocKy> findAllNienKhoaHocKy() {
		return nienKhoaHocKyDao.findAllNienKhoaHocKy();
	}

	@Override
	public NienKhoaHocKy findNienKhoaHocKyById(long Id) {
		return nienKhoaHocKyDao.findNienKhoaHocKyById(Id);
	}

	@Override
	public NienKhoaHocKy findNienKhoaHocKyByHocKyAndNienKhoa(String hocKy,
			String nienKhoa) {
		return nienKhoaHocKyDao.findNienKhoaHocKyByHocKyAndNienKhoa(hocKy, nienKhoa);
	}

}
