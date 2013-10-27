package vn.com.luanvan.dao;

import java.util.List;

import vn.com.luanvan.model.ChuongTrinhDaoTao;


public interface ChuongTrinhDaoTaoDao {
	
	public boolean saveChuongTrinhDaoTao(ChuongTrinhDaoTao chuongTrinhDaoTao);
	
	public boolean updateChuongTrinhDaoTao(ChuongTrinhDaoTao chuongTrinhDaoTao);
	
	public boolean deleteChuongTrinhDaoTao(long id);
	
	public List<ChuongTrinhDaoTao> findAllChuongTrinhDaoTao();
	
	public ChuongTrinhDaoTao findChuongTrinhDaoTaoById(long Id);

}
