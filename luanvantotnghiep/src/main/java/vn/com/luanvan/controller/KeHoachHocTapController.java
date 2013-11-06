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

import vn.com.luanvan.model.HocPhan;
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
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("nganh", "ok");
		
	
		List<HocPhan> hps = hocPhanService.findHocPhanByNganhIdAndKhoaDaoTaoId(nganhId, khoaDaoTaoId);
		
		for(HocPhan hp : hps){
			System.out.println(hp.getTenHP());
		}
	
		return map;
	}
}
