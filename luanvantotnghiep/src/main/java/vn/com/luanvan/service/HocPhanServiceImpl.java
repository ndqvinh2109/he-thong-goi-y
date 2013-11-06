package vn.com.luanvan.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import vn.com.luanvan.dao.HocPhanDao;
import vn.com.luanvan.model.HocPhan;

@Service
@Transactional
public class HocPhanServiceImpl implements HocPhanService{
	
	@Autowired
	private HocPhanDao hocPhanDao;

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
	public List<HocPhan> findHocPhanByNganhIdAndKhoaDaoTaoId(long nganhId,
			long khoaDaoTaoId) {
		hocPhanDao.findHocPhanByNganhIdAndKhoaDaoTaoId(nganhId, khoaDaoTaoId);
		return null;
	}

}
