package vn.com.luanvan.service;

import java.util.List;

import vn.com.luanvan.model.Nganh;

public interface NganhService {
	
	public boolean saveNganh(Nganh nganh);
	
	public boolean updateNganh(Nganh nganh);
	
	public boolean deleteNganh(long id);
	
	public List<Nganh> findAllNganh();
	
	public Nganh findNganhById(long Id);	
}
