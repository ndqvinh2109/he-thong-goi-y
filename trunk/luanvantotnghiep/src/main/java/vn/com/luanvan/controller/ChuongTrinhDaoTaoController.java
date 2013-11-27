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
			@RequestParam(value="hocKyMacDinh", required = false) String hocKyMacDinh){
		
		HocPhan hocphan = hocPhanService.findHocPhanByMaHocPhan(maHocPhan);
		KhoaDaoTao khoaDaoTao = khoaDaoTaoService.findKhoaDaoTaoById(khoaDaoTaoId);
		Nganh nganh = nganhService.findNganhById(nganhId);
		
		ChuongTrinhDaoTao chuongTrinhDaoTao = new ChuongTrinhDaoTao();
		chuongTrinhDaoTao.setTuChon(String.valueOf(hocphan.getSoTC()));
		chuongTrinhDaoTao.setHocKyMacDinh(hocKyMacDinh);
		chuongTrinhDaoTao.setHocPhan(hocphan);
		chuongTrinhDaoTao.setKhoaDaoTao(khoaDaoTao);
		chuongTrinhDaoTao.setNganh(nganh);
		chuongTrinhDaoTao.setNhomTuChon(khoiKienThuc + nhomHocPhan);
		chuongTrinhDaoTao.setKhoiKienThuc(khoiKienThuc);
		
		
		return true;
	}
}
