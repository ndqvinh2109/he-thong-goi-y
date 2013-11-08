package vn.com.luanvan.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class SinhVienController {
	@RequestMapping(value="sinhvien", method = RequestMethod.GET)
	public String loadPageSinhVien(Map<String,Object> map){		
		return "sinhvien";
	}
}
