package vn.com.luanvan.service;

import java.util.List;

import vn.com.luanvan.model.KhoaChuQuan;



public interface KhoaChuQuanService {
	
	public boolean saveKhoaChuQuan(KhoaChuQuan khoachuquan);
	
	public boolean updateKhoaChuQuan(KhoaChuQuan khoaChuQuan);
	
	public boolean deleteKhoaChuQuan(long id);
	
	public List<KhoaChuQuan> findAllKhoaChuQuan();
	
	public KhoaChuQuan findKhoaChuQuanById(long Id);
	
}
