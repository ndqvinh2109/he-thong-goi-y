package vn.com.luanvan.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import vn.com.luanvan.model.Diem;
import vn.com.luanvan.model.HocPhan;
import vn.com.luanvan.service.HocPhanService;
import vn.com.luanvan.service.SinhVienService;

@Controller
public class DuDoanDiemHocPhan {
	
	@Autowired
	private HocPhanService hocPhanService;
	@Autowired
	private SinhVienService sinhVienService;
	
	@RequestMapping(value="dudoandiemhocphan", method = RequestMethod.GET)
	public String loadPageDuDoanKetQuaHocPhan(Map<String,Object> map){
		map.put("sinhViens", sinhVienService.findAllSinhVien());
		long sinhvienid = 2L;
		List<Object[]> dsdiemhp = hocPhanService.findHocPhanBySinhVienIdAndNienKhoaId(sinhvienid);
		for (Object[] diemhp : dsdiemhp){
			HocPhan hocphan = (HocPhan) diemhp[0];
			Diem diem = (Diem) diemhp[1];
			System.out.println(hocphan.getTenHP()+" "+diem.getDiem());
		}
		return "dudoandiemhocphan";
	}
	
	@RequestMapping(value="loadDuDoanDiemHocPhan", method=RequestMethod.GET)
	public @ResponseBody Map<String, Object> loadDuDoanDiemHocPhan(
			@RequestParam(value="sinhVienId", required = false) long sinhVienId){
		System.out.println(sinhVienId);
		Map<String,Object> map = new HashMap<String,Object>();
		List<Object[]> hps = hocPhanService.findHocPhanBySinhVienIdAndNienKhoaId(sinhVienId);
		map.put("danhSachDiemHocPhan", hps);
		
/*		List<String> list = hocPhanService.findNhomTuChonByHocPhanId(4L);
		for(String tt: list){
			System.out.println(tt);
		}
*/		
/*		List<Object[]> hptqs = hocPhanService.findHocPhanCoHocPhanTienQuyet();
		for (Object[] hptq : hptqs){
			HocPhan hocphan = (HocPhan) hptq[0];
			System.out.println(hocphan.getTenHP());
		}
*/		
		return map;
	}
	
}
