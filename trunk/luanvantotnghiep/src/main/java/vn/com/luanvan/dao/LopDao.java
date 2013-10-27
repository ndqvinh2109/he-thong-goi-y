package vn.com.luanvan.dao;

import java.util.List;

import vn.com.luanvan.model.Lop;

public interface LopDao {
	
	public boolean saveLop(Lop lop);
	
	public boolean updateLop(Lop lop);
	
	public boolean deleteLop(long id);
	
	public List<Lop> findAllLop();
	
	public Lop findLopById(long Id);

}
