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

import vn.com.luanvan.service.DiemService;
import vn.com.luanvan.service.HocPhanService;
import vn.com.luanvan.service.SinhVienService;
import vn.com.luanvan.utils.MF;

@Controller
public class DuDoanDiemHocPhan {
	
	@Autowired
	private HocPhanService hocPhanService;
	@Autowired
	private SinhVienService sinhVienService;
	@Autowired
	private MF mf;
	@Autowired
	private DiemService diemService;
	
	@RequestMapping(value="dudoandiemhocphan", method = RequestMethod.GET)
	public String loadPageDuDoanKetQuaHocPhan(Map<String,Object> map){
		map.put("sinhViens", sinhVienService.findAllSinhVien());
		return "dudoandiemhocphan";
	}
	
	@RequestMapping(value="loadDuDoanDiemHocPhan", method=RequestMethod.GET)
	public @ResponseBody Map<String, Object> loadDuDoanDiemHocPhan(
			@RequestParam(value="sinhVienId", required = false) long sinhVienId){
		Map<String,Object> map = new HashMap<String,Object>();
		List<Object[]> hps = hocPhanService.findHocPhanBySinhVienIdAndNienKhoaId(sinhVienId);
		map.put("danhSachDiemHocPhan", hps);
		return map;
	}
	
	@RequestMapping(value="ghiFile", method=RequestMethod.GET)
	public @ResponseBody boolean ghiFile(){
		return diemService.ghiFile();
	}
	
	@RequestMapping(value="duDoanDiem", method=RequestMethod.GET)
	public @ResponseBody boolean duDoanDiem(){
		try {
			mf.mainMF();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		
	}
	
}
