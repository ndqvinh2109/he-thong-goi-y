package vn.com.luanvan.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import vn.com.luanvan.dao.ChuongTrinhDaoTaoDao;
import vn.com.luanvan.model.ChuongTrinhDaoTao;


@Service
@Transactional
public class ChuongTrinhDaoTaoServiceImpl implements ChuongTrinhDaoTaoService{
	
	@Autowired
	private ChuongTrinhDaoTaoDao chuongTrinhDaoTaoDao;

	@Override
	public boolean saveChuongTrinhDaoTao(ChuongTrinhDaoTao chuongTrinhDaoTao) {
		
		return chuongTrinhDaoTaoDao.saveChuongTrinhDaoTao(chuongTrinhDaoTao);
	}

	@Override
	public boolean updateChuongTrinhDaoTao(ChuongTrinhDaoTao chuongTrinhDaoTao) {
		
		return chuongTrinhDaoTaoDao.updateChuongTrinhDaoTao(chuongTrinhDaoTao);
	}

	@Override
	public boolean deleteChuongTrinhDaoTao(long id) {
		
		return chuongTrinhDaoTaoDao.deleteChuongTrinhDaoTao(id);
	}

	@Override
	public List<ChuongTrinhDaoTao> findAllChuongTrinhDaoTao() {
		
		return chuongTrinhDaoTaoDao.findAllChuongTrinhDaoTao();
	}

	@Override
	public ChuongTrinhDaoTao findChuongTrinhDaoTaoById(long Id) {
		
		return chuongTrinhDaoTaoDao.findChuongTrinhDaoTaoById(Id);
	}

	@Override
	public String findSoTinChiTuChonByNhomTuChon(String nhomTuChon) {
		return chuongTrinhDaoTaoDao.findSoTinChiTuChonByNhomTuChon(nhomTuChon);
	}

}
