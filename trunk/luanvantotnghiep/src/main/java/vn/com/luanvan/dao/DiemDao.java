package vn.com.luanvan.dao;

import java.util.List;

import vn.com.luanvan.model.Diem;

public interface DiemDao {
	
	public boolean saveDiem(Diem diem);
	
	public boolean updateDiem(Diem diem);
	
	public boolean deleteDiem(long id);
	
	public List<Diem> findAllDiem();
	
	public Diem findDiemById(long Id);

}
