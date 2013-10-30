package vn.com.luanvan.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import vn.com.luanvan.service.KhoaDaoTaoService;
import vn.com.luanvan.service.NganhService;

@Controller
public class KeHoachHocTapController {
	
	@Autowired
	private NganhService nganhService;
	@Autowired
    private KhoaDaoTaoService khoaDaoTaoService;
    
	@RequestMapping(value="kehoachhoctap", method = RequestMethod.GET)
	public String loadPageKeHoachHocTap(Map<String,Object> map){
		return "kehoachhoctap";
	}
}
