package vn.com.luanvan.dao;

import java.util.List;

import vn.com.luanvan.model.HocPhanTienQuyet;

public interface HocPhanTienQuyetDao {
	
	public boolean saveHocPhanTienQuyet (HocPhanTienQuyet hocPhanTienQuyet);
	
	public boolean updateHocPhanTienQuyet (HocPhanTienQuyet hocPhanTienQuyet);
	
	public boolean deleteHocPhanTienQuyet (long id);
	
	public List<HocPhanTienQuyet> findAllHocPhanTienQuyet();
	
	public HocPhanTienQuyet findHocPhanTienQuyetById(long Id);

}
