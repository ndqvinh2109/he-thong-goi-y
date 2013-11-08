package vn.com.luanvan.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import vn.com.luanvan.service.HocPhanService;

@Controller
public class SinhVienController {
	
	@Autowired
	private HocPhanService sinhVienService;
    
	@RequestMapping(value="kehoachhoctapcuasinhvien", method = RequestMethod.GET)
	public String loadPageKeHoachHocTapCuaSinhVien(Map<String,Object> map){
		try {
			map.put("nganhs", "");
			map.put("khoaDaoTaos", "");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "kehoachhoctapcuasinhvien";
	}

}
