package vn.com.luanvan.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import vn.com.luanvan.service.KhoaDaoTaoService;
import vn.com.luanvan.service.NganhService;

@Controller
public class LapKeHoachHocTapController {
	@Autowired
	private NganhService nganhService;
	@Autowired
    private KhoaDaoTaoService khoaDaoTaoService;
	@RequestMapping(value="lapkehoachhoctap", method = RequestMethod.GET)
	public String loadPageLapKeHoachHocTap(Map<String,Object> map){
		try {
			map.put("nganhs", nganhService.findAllNganh());
			map.put("khoaDaoTaos", khoaDaoTaoService.findAllKhoaDaoTao());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "lapkehoachhoctap";
	}
	
	
}
