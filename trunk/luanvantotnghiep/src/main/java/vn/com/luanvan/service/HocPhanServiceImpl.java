package vn.com.luanvan.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import vn.com.luanvan.dao.HocPhanDao;
import vn.com.luanvan.dao.KhoaDaoTaoDao;
import vn.com.luanvan.dao.NganhDao;
import vn.com.luanvan.model.HocPhan;
import vn.com.luanvan.model.HocPhanTienQuyet;
import vn.com.luanvan.model.KhoaDaoTao;
import vn.com.luanvan.model.Nganh;

@Service
@Transactional
public class HocPhanServiceImpl implements HocPhanService{
	
	@Autowired
	private HocPhanDao hocPhanDao;
	@Autowired
	private NganhDao nganhDao;
	@Autowired
	private KhoaDaoTaoDao khoaDaoTaoDao;

	@Override
	public boolean saveHocPhan(HocPhan hocPhan) {
		return hocPhanDao.saveHocPhan(hocPhan);
	}

	@Override
	public boolean updateHocPhan(HocPhan hocPhan) {
		return hocPhanDao.updateHocPhan(hocPhan);
	}

	@Override
	public boolean deleteHocPhan(long id) {
		return hocPhanDao.deleteHocPhan(id);
	}

	@Override
	public List<HocPhan> findAllHocPhan() {
		return hocPhanDao.findAllHocPhan();
	}

	@Override
	public HocPhan findHocPhanById(long Id) {
		return hocPhanDao.findHocPhanById(Id);
	}

	@Override
	public List<Object[]> findHocPhanByNganhIdAndKhoaDaoTaoId(long nganhId,
			long khoaDaoTaoId) {
		return hocPhanDao.findHocPhanByNganhIdAndKhoaDaoTaoId(nganhId, khoaDaoTaoId);
	}


	@Override
	public List<HocPhanTienQuyet> findHocPhanTienQuyetByHocPhanId(long hocPhanId) {
		return hocPhanDao.findHocPhanTienQuyetByHocPhanId(hocPhanId);
	}

	@Override
	public List<String> findNhomTuChonByHocPhanId(long hocPhanId) {
		return hocPhanDao.findNhomTuChonByHocPhanId(hocPhanId);
	}

	@Override
	public List<Object[]> findHocPhanBySinhVienIdAndNienKhoaId(long sinhVienId) {
		return hocPhanDao.findHocPhanBySinhVienIdAndNienKhoaId(sinhVienId);
	}

	@Override
	public List<Object[]> findHocPhanByNganhIdAndKhoaDaoTaoKHHTId(long nganhId,
			long khoaDaoTaoId) {
		return hocPhanDao.findHocPhanByNganhIdAndKhoaDaoTaoKHHTId(nganhId, khoaDaoTaoId);
	}

	@Override
	public HocPhan findHocPhanByMaHocPhan(String maHocPhan) {
		return hocPhanDao.findHocPhanByMaHocPhan(maHocPhan);
	}

	@Override
	public List<Object[]> findChuongTrinhDaoTaoSinhVienBySinhVienId(long sinhVienId) {
		Nganh nganh = nganhDao.findNganhBySinhVienId(sinhVienId);
		KhoaDaoTao khoaDaoTao = khoaDaoTaoDao.findKhoaDaoTaoBySinhVienId(sinhVienId);
		return hocPhanDao.findHocPhanByNganhIdAndKhoaDaoTaoId(nganh.getNganhId(), khoaDaoTao.getKhoaDaoTaoId());
	}
}
