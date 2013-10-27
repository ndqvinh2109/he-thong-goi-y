package vn.com.luanvan.service;

import java.util.List;

import vn.com.luanvan.model.NienKhoaHocKy;

public interface NienKhoaHocKyService {
	
	public boolean saveNienKhoaHocKy(NienKhoaHocKy nienKhoaHocKy);
	
	public boolean updateNienKhoaHocKy(NienKhoaHocKy nienKhoaHocKy);
	
	public boolean deleteNienKhoaHocKy(long id);
	
	public List<NienKhoaHocKy> findAllNienKhoaHocKy();
	
	public NienKhoaHocKy findNienKhoaHocKyById(long Id);


}
