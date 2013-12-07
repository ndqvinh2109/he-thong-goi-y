package vn.com.luanvan;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import vn.com.luanvan.model.SinhVien;
import vn.com.luanvan.service.SinhVienService;
import vn.com.luanvan.utils.Utils;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	private SinhVienService sinhVienService;
	@Autowired
	private Utils utils;
	
	@RequestMapping(value = "/homepage", method = RequestMethod.GET)
	public String home(Map<String, Object> map) throws Exception{
		String maSinhVien = utils.getLoggedInMember();
		SinhVien sinhVien = sinhVienService.findSinhVienByMaSinhVien(maSinhVien);
		String result = maSinhVien;
		if(sinhVien != null){
			result = sinhVien.getHoTen();
		}
		map.put("tenSinhVien", result);
		return "trangchu";
	}
	
}
