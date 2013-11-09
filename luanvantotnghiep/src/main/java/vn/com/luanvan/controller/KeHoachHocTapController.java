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

import vn.com.luanvan.model.HocPhanTienQuyet;
import vn.com.luanvan.service.HocPhanService;
import vn.com.luanvan.service.KhoaDaoTaoService;
import vn.com.luanvan.service.NganhService;

@Controller
public class KeHoachHocTapController {
	
	@Autowired
	private NganhService nganhService;
	@Autowired
    private KhoaDaoTaoService khoaDaoTaoService;
	@Autowired
	private HocPhanService hocPhanService;
    
	@RequestMapping(value="kehoachhoctap", method = RequestMethod.GET)
	public String loadPageKeHoachHocTap(Map<String,Object> map){
		try {
			map.put("nganhs", nganhService.findAllNganh());
			map.put("khoaDaoTaos", khoaDaoTaoService.findAllKhoaDaoTao());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "kehoachhoctap";
	}
	
	@RequestMapping(value="loadChuongTrinhDaoTao", method=RequestMethod.GET)
	public @ResponseBody Map<String, Object> loadChuongTrinhDaoTao(
			@RequestParam(value="nganhId", required = false) long nganhId,
			@RequestParam(value="khoaDaoTaoId", required= false) long khoaDaoTaoId){
		System.out.println(nganhId + " " + khoaDaoTaoId);
		Map<String,Object> map = new HashMap<String,Object>();
		List<Object[]> hps = hocPhanService.findHocPhanByNganhIdAndKhoaDaoTaoId(nganhId, khoaDaoTaoId);
		map.put("danhSachHocPhan", hps);
		
		List<String> list = hocPhanService.findNhomTuChonByHocPhanId(4L);
		for(String tt: list){
			System.out.println(tt);
		}
		
/*		List<Object[]> hptqs = hocPhanService.findHocPhanCoHocPhanTienQuyet();
		for (Object[] hptq : hptqs){
			HocPhan hocphan = (HocPhan) hptq[0];
			System.out.println(hocphan.getTenHP());
		}
*/		
		return map;
	}
	
	@RequestMapping(value="loadHocPhanTienQuyetByHocPhanId",method=RequestMethod.GET)
	public @ResponseBody Map<String, Object> loadHocPhanTienQuyetByHocPhanId(
			@RequestParam(value="hocPhanId", required=false) long hocPhanId){
		Map<String,Object> map = new HashMap<String,Object>();
		List<HocPhanTienQuyet> hptqs = hocPhanService.findHocPhanTienQuyetByHocPhanId(hocPhanId);
		map.put("hptq", hptqs);
		return map;
	}
}
