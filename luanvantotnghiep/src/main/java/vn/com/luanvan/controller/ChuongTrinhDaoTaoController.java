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

import vn.com.luanvan.model.ChuongTrinhDaoTao;
import vn.com.luanvan.model.HocPhan;
import vn.com.luanvan.model.HocPhanTienQuyet;
import vn.com.luanvan.model.KhoaDaoTao;
import vn.com.luanvan.model.Nganh;
import vn.com.luanvan.service.ChuongTrinhDaoTaoService;
import vn.com.luanvan.service.HocPhanService;
import vn.com.luanvan.service.KhoaDaoTaoService;
import vn.com.luanvan.service.NganhService;

@Controller
public class ChuongTrinhDaoTaoController {
	
	@Autowired
	private NganhService nganhService;
	@Autowired
    private KhoaDaoTaoService khoaDaoTaoService;
	@Autowired
	private HocPhanService hocPhanService;
	@Autowired
	private ChuongTrinhDaoTaoService chuongTrinhDaoTaoService;
    
	@RequestMapping(value="chuongtrinhdaotao", method = RequestMethod.GET)
	public String loadPageChuongTrinhDaoTao(Map<String,Object> map){
		try {
			map.put("nganhs", nganhService.findAllNganh());
			map.put("khoaDaoTaos", khoaDaoTaoService.findAllKhoaDaoTao());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "chuongtrinhdaotao";
	}
	
	@RequestMapping(value="loadChuongTrinhDaoTao", method=RequestMethod.GET)
	public @ResponseBody Map<String, Object> loadChuongTrinhDaoTao(
			@RequestParam(value="nganhId", required = false) long nganhId,
			@RequestParam(value="khoaDaoTaoId", required= false) long khoaDaoTaoId){
		Map<String,Object> map = new HashMap<String,Object>();
		List<Object[]> hps = hocPhanService.findHocPhanByNganhIdAndKhoaDaoTaoId(nganhId, khoaDaoTaoId);
		map.put("danhSachHocPhan", hps);
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
	
	@RequestMapping(value="themHocPhan",method=RequestMethod.GET)
	public @ResponseBody boolean themHocPhan(
			@RequestParam(value="nganhId", required = false) long nganhId,
			@RequestParam(value="khoaDaoTaoId", required = false) long khoaDaoTaoId,
			@RequestParam(value="khoiKienThuc", required = false) String khoiKienThuc,
			@RequestParam(value="maHocPhan", required = false) String maHocPhan,
			@RequestParam(value="nhomHocPhan", required = false) String nhomHocPhan,
			@RequestParam(value="hocKyMacDinh", required = false) String hocKyMacDinh,
			@RequestParam(value="tuChon", required = false) boolean tuChon,
			@RequestParam(value="tinChiTuChon", required = false) String tinChiTuChon){
		
			String appendStr = "";
			String tinChiTC = "";
			HocPhan hocphan = hocPhanService.findHocPhanByMaHocPhan(maHocPhan);
			KhoaDaoTao khoaDaoTao = khoaDaoTaoService.findKhoaDaoTaoById(khoaDaoTaoId);
			Nganh nganh = nganhService.findNganhById(nganhId);
			
			ChuongTrinhDaoTao chuongTrinhDaoTao = new ChuongTrinhDaoTao();
			
			chuongTrinhDaoTao.setHocKyMacDinh(hocKyMacDinh);
			chuongTrinhDaoTao.setHocPhan(hocphan);
			chuongTrinhDaoTao.setKhoaDaoTao(khoaDaoTao);
			chuongTrinhDaoTao.setNganh(nganh);
			if(tuChon){
				appendStr = khoiKienThuc + nhomHocPhan;
				tinChiTC = tinChiTuChon;
			}else{
				appendStr = nhomHocPhan;
				tinChiTC = "0";
			}
			chuongTrinhDaoTao.setTuChon(tinChiTC);
			chuongTrinhDaoTao.setNhomTuChon(appendStr);
			chuongTrinhDaoTao.setKhoiKienThuc(khoiKienThuc);
						
		return chuongTrinhDaoTaoService.saveChuongTrinhDaoTao(chuongTrinhDaoTao);
	}
	
	
	@RequestMapping(value="loadHocPhanByMaHocPhan",method=RequestMethod.GET)
	public @ResponseBody Map<String, Object> loadHocPhanByMaHocPhan(
			@RequestParam(value="maHocPhan", required=false) String maHocPhan){
		Map<String,Object> map = new HashMap<String,Object>();
		HocPhan hocPhan = hocPhanService.findHocPhanByMaHocPhan(maHocPhan);
		map.put("hocPhan", hocPhan);
		return map;
	}
	
	
	@RequestMapping(value="loadSoTinChiTuChon",method=RequestMethod.GET)
	public @ResponseBody String loadHocPhanByMaHocPhan(
			@RequestParam(value="nhomHocPhan", required=false) String nhomHocPhan,
			@RequestParam(value="khoiKienThuc", required=false) String khoiKienThuc){
		String strTinChi = chuongTrinhDaoTaoService.findSoTinChiTuChonByNhomTuChon(khoiKienThuc + nhomHocPhan);
		return strTinChi;
	}
}
