package vn.com.luanvan.dao;

import java.util.List;

import vn.com.luanvan.model.KhoaDaoTao;

public interface KhoaDaoTaoDao {
	public boolean saveKhoaDaoTao(KhoaDaoTao khoaDaoTao);
	
	public boolean updateKhoaDaoTao(KhoaDaoTao khoaDaoTao);
	
	public boolean deleteKhoaDaoTao(long id);
	
	public List<KhoaDaoTao> findAllKhoaDaoTao();
	
	public KhoaDaoTao findKhoaDaoTaoById(long id);
}
