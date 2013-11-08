package vn.com.luanvan.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import vn.com.luanvan.dao.HocPhanDao;
import vn.com.luanvan.model.HocPhan;
import vn.com.luanvan.model.HocPhanTienQuyet;

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
	public List<Object[]> findHocPhanByNganhIdAndKhoaDaoTaoId(long nganhId,
			long khoaDaoTaoId) {
		return hocPhanDao.findHocPhanByNganhIdAndKhoaDaoTaoId(nganhId, khoaDaoTaoId);
	}

	@Override
	public List<Object[]> findHocPhanCoHocPhanTienQuyet(){
		return hocPhanDao.findHocPhanCoHocPhanTienQuyet();
	}
	
	@Override
	public List<Object[]> findAllHocPhanHocPhanTienQuyet(){
		return hocPhanDao.findAllHocPhanHocPhanTienQuyet();
	}

	@Override
	public List<HocPhanTienQuyet> findHocPhanTienQuyetByHocPhanId(long hocPhanId) {
		return hocPhanDao.findHocPhanTienQuyetByHocPhanId(hocPhanId);
	}

	@Override
	public List<String> findNhomTuChonByHocPhanId(long hocPhanId) {
		return hocPhanDao.findNhomTuChonByHocPhanId(hocPhanId);
	}
}
