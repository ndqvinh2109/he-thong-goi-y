package vn.com.luanvan.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import vn.com.luanvan.dao.SinhVienDao;
import vn.com.luanvan.model.SinhVien;

@Service
@Transactional
public class SinhVienServiceImpl implements SinhVienService{

	@Autowired
	private SinhVienDao sinhVienDao;
	
	@Override
	public boolean saveSinhVien(SinhVien sinhVien) {
		return sinhVienDao.saveSinhVien(sinhVien);
	}

	@Override
	public boolean updateSinhVien(SinhVien sinhVien) {
		return sinhVienDao.updateSinhVien(sinhVien);
	}

	@Override
	public boolean deleteSinhVien(long id) {
		return sinhVienDao.deleteSinhVien(id);
	}

	@Override
	public List<SinhVien> findAllSinhVien() {
		return sinhVienDao.findAllSinhVien();
	}

	@Override
	public SinhVien findSinhVienById(long Id) {
		return sinhVienDao.findSinhVienById(Id);
	}
	
	@Autowired
	public List<Object[]> findDiemCuaSinhVien(){
		return sinhVienDao.findDiemCuaSinhVien();
	}

	@Override
	public SinhVien findSinhVienByMaSinhVien(String maSinhVien) {
		return sinhVienDao.findSinhVienByMaSinhVien(maSinhVien);
	}

}
