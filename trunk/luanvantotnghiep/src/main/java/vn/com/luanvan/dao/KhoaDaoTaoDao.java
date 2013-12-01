package vn.com.luanvan.dao;

import java.util.List;

import vn.com.luanvan.model.KhoaDaoTao;
import vn.com.luanvan.model.Nganh;

public interface KhoaDaoTaoDao {
	public boolean saveKhoaDaoTao(KhoaDaoTao khoaDaoTao);
	
	public boolean updateKhoaDaoTao(KhoaDaoTao khoaDaoTao);
	
	public boolean deleteKhoaDaoTao(long id);
	
	public List<KhoaDaoTao> findAllKhoaDaoTao();
	
	public KhoaDaoTao findKhoaDaoTaoById(long id);
	
	public KhoaDaoTao findKhoaDaoTaoBySinhVienId(long sinhVienId);
}
