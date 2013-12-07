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
import vn.com.luanvan.model.Nganh;
import vn.com.luanvan.model.SinhVien;
import vn.com.luanvan.service.HocPhanService;
import vn.com.luanvan.service.KhoaDaoTaoService;
import vn.com.luanvan.service.NganhService;
import vn.com.luanvan.service.SinhVienService;
import vn.com.luanvan.utils.Utils;

@Controller
public class KeHoachHocTapController {

	@Autowired
	private NganhService nganhService;
	@Autowired
    private KhoaDaoTaoService khoaDaoTaoService;
	@Autowired
	private HocPhanService hocPhanService;
	@Autowired
	private SinhVienService sinhVienService;
	@Autowired
	private Utils utils;
	
	@RequestMapping(value="kehoachhoctap", method = RequestMethod.GET)
	public String loadPageKeHoachHocTap(Map<String,Object> map){
		try {
			String maSinhVien = utils.getLoggedInMember();
			SinhVien sinhVien = sinhVienService.findSinhVienByMaSinhVien(maSinhVien);
			String result = maSinhVien;
			if(sinhVien != null){
				result = sinhVien.getHoTen();
			}
			map.put("tenSinhVien", result);
			map.put("nganhs", nganhService.findAllNganh());
			map.put("khoaDaoTaos", khoaDaoTaoService.findAllKhoaDaoTao());
		} catch (Exception e) {
		}
		return "kehoachhoctap";
	}
	
	@RequestMapping(value="loadKeHoachHocTap", method=RequestMethod.GET)
	public @ResponseBody Map<String, Object> loadChuongTrinhDaoTao(
			@RequestParam(value="nganhId", required = false) long nganhId,
			@RequestParam(value="khoaDaoTaoId", required= false) long khoaDaoTaoId){
		Map<String,Object> map = new HashMap<String,Object>();
		List<Object[]> hps = hocPhanService.findHocPhanByNganhIdAndKhoaDaoTaoKHHTId(nganhId, khoaDaoTaoId);
		Nganh nganh = nganhService.findNganhById(nganhId);
		map.put("danhSachHocPhan", hps);
		map.put("maNganh", nganh.getMaNganh());
		map.put("tenNganh", nganh.getTenNganh());
		return map;
	}
	
	@RequestMapping(value="loadHocPhanTienQuyetKHHTByHocPhanId",method=RequestMethod.GET)
	public @ResponseBody Map<String, Object> loadHocPhanTienQuyetByHocPhanId(
			@RequestParam(value="hocPhanId", required=false) long hocPhanId){
		Map<String,Object> map = new HashMap<String,Object>();
		List<HocPhanTienQuyet> hptqs = hocPhanService.findHocPhanTienQuyetByHocPhanId(hocPhanId);
		map.put("hptq", hptqs);
		return map;
	}
	
	@RequestMapping(value="test",method=RequestMethod.POST)
	public @ResponseBody String test(@RequestParam("value") String value){
		System.out.println(value);
		return "ttt";
	}
}
