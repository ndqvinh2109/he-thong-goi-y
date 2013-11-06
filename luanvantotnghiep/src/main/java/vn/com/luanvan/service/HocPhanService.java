package vn.com.luanvan.service;

import java.util.List;

import vn.com.luanvan.model.HocPhan;

public interface HocPhanService {
	
	public boolean saveHocPhan(HocPhan hocPhan);
	
	public boolean updateHocPhan(HocPhan hocPhan);
	
	public boolean deleteHocPhan(long id);
	
	public List<HocPhan> findAllHocPhan();
	
	public HocPhan findHocPhanById(long Id);
	
	public List<HocPhan> findHocPhanByNganhIdAndKhoaDaoTaoId(long nganhId, long khoaDaoTaoId);

}
