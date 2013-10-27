package vn.com.luanvan.dao;

import java.util.List;

import vn.com.luanvan.model.BoMon;

public interface BoMonDao {
	
	public boolean saveBoMon(BoMon boMon);
	
	public boolean updateBoMon(BoMon boMon);
	
	public boolean deleteBoMon(long id);
	
	public List<BoMon> findAllBoMon();
	
	public BoMon findBoMonById(long Id);
}
