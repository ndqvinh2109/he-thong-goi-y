package vn.com.luanvan.dao;

import java.util.List;

import vn.com.luanvan.model.HocPhan;

public interface HocPhanDao {
	
	public boolean saveHocPhan(HocPhan hocPhan);
	
	public boolean updateHocPhan(HocPhan hocPhan);
	
	public boolean deleteHocPhan(long id);
	
	public List<HocPhan> findAllHocPhan();
	
	public HocPhan findHocPhanById(long Id);

}
