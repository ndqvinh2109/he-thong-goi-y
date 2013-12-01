package vn.com.luanvan.service;

import java.util.List;

import vn.com.luanvan.model.HocPhan;
import vn.com.luanvan.model.HocPhanTienQuyet;

public interface HocPhanService {
	
	public boolean saveHocPhan(HocPhan hocPhan);
	
	public boolean updateHocPhan(HocPhan hocPhan);
	
	public boolean deleteHocPhan(long id);
	
	public List<HocPhan> findAllHocPhan();
	
	public HocPhan findHocPhanById(long Id);
	
	public List<Object[]> findHocPhanByNganhIdAndKhoaDaoTaoId(long nganhId, long khoaDaoTaoId);
	
	public List<HocPhanTienQuyet> findHocPhanTienQuyetByHocPhanId(long hocPhanId);
	
	public List<String> findNhomTuChonByHocPhanId(long hocPhanId);
	
	public List<Object[]> findHocPhanBySinhVienIdAndNienKhoaId(long sinhVienId);
	
	public List<Object[]> findHocPhanByNganhIdAndKhoaDaoTaoKHHTId(long nganhId, long khoaDaoTaoId);
	
	public HocPhan findHocPhanByMaHocPhan(String maHocPhan);
	
	public List<Object[]> findChuongTrinhDaoTaoSinhVienBySinhVienId(long sinhVienId);
}
