package vn.com.luanvan.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import vn.com.luanvan.dao.KhoaDaoTaoDao;
import vn.com.luanvan.model.KhoaDaoTao;

@Service
@Transactional
public class KhoaDaoTaoServiceImpl implements KhoaDaoTaoService{

	@Autowired
	private KhoaDaoTaoDao khoaDaoTaoDao;
	
	@Override
	public boolean saveKhoaDaoTao(KhoaDaoTao khoaDaoTao) {
		return khoaDaoTaoDao.saveKhoaDaoTao(khoaDaoTao);
	}

	@Override
	public boolean updateKhoaDaoTao(KhoaDaoTao khoaDaoTao) {
		return khoaDaoTaoDao.updateKhoaDaoTao(khoaDaoTao);
	}

	@Override
	public boolean deleteKhoaDaoTao(long id) {
		return khoaDaoTaoDao.deleteKhoaDaoTao(id);
	}

	@Override
	public List<KhoaDaoTao> findAllKhoaDaoTao() {
		return khoaDaoTaoDao.findAllKhoaDaoTao();
	}

	@Override
	public KhoaDaoTao findKhoaDaoTaoById(long id) {
		return khoaDaoTaoDao.findKhoaDaoTaoById(id);
	}

	@Override
	public KhoaDaoTao findKhoaDaoTaoBySinhVienId(long sinhVienId) {
		return khoaDaoTaoDao.findKhoaDaoTaoBySinhVienId(sinhVienId);
	}
	
}
