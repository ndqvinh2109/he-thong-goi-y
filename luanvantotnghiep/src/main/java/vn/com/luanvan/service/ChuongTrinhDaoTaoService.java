package vn.com.luanvan.service;

import java.util.List;

import vn.com.luanvan.model.ChuongTrinhDaoTao;

public interface ChuongTrinhDaoTaoService {	
	
	public boolean saveChuongTrinhDaoTao(ChuongTrinhDaoTao chuongTrinhDaoTao);
	
	public boolean updateChuongTrinhDaoTao(ChuongTrinhDaoTao chuongTrinhDaoTao);
	
	public boolean deleteChuongTrinhDaoTao(long id);
	
	public List<ChuongTrinhDaoTao> findAllChuongTrinhDaoTao();
	
	public ChuongTrinhDaoTao findChuongTrinhDaoTaoById(long Id);

	public String findSoTinChiTuChonByNhomTuChon(String nhomTuChon);
	
	public boolean checkHocPhanExistInChuongTrinhDaoTao(String maHocPhan, long nganhId, long khoaDaoTaoId);
}
