package vn.com.luanvan.dao;

import java.util.List;

import vn.com.luanvan.model.SinhVien;

public interface SinhVienDao {

	public boolean saveSinhVien(SinhVien sinhVien);
	
	public boolean updateSinhVien(SinhVien sinhVien);
	
	public boolean deleteSinhVien(long id);
	
	public List<SinhVien> findAllSinhVien();
	
	public SinhVien findSinhVienById(long Id);
	
	public List<Object[]> findDiemCuaSinhVien();
	
	public SinhVien findSinhVienByMaSinhVien(String maSinhVien);
	
	
}
