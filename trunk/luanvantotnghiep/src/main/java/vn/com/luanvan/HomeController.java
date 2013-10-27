package vn.com.luanvan;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import vn.com.luanvan.model.BoMon;
import vn.com.luanvan.model.KhoaChuQuan;
import vn.com.luanvan.model.Nganh;
import vn.com.luanvan.service.BoMonService;
import vn.com.luanvan.service.KhoaChuQuanService;
import vn.com.luanvan.service.NganhService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@Autowired
	private BoMonService boMonService;
	@Autowired
	private KhoaChuQuanService khoaChuQuanService;

	@Autowired
	private NganhService nganhService;
	
	@RequestMapping(value = "/homepage", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		KhoaChuQuan khoaChuQuan = new KhoaChuQuan();
		khoaChuQuan.setMaKhoa("cntt");
		khoaChuQuan.setTenKhoa("Cong nghe thong tin");
		khoaChuQuanService.saveKhoaChuQuan(khoaChuQuan);
		
		BoMon boMon = new BoMon();
		boMon.setMaBoMon("httt");
		boMon.setTenBoMon("He thong thong tin");
		boMon.setKhoaChuQuan(khoaChuQuan);
		boMonService.saveBoMon(boMon);
		
		Nganh nganh = new Nganh();
		nganh.setMaNganh("dihh");
		nganh.setTenNganh("information system");
		nganh.setBomon(boMon);
		nganhService.saveNganh(nganh);
		nganh.setTenNganh("information system 2");
		nganh.setBomon(boMon);
		nganhService.updateNganh(nganh);
	
		return "trangchu";
	}
	
}
