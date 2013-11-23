package vn.com.luanvan;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import vn.com.luanvan.service.DiemService;
import vn.com.luanvan.utils.MF;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	private MF mf;
	@Autowired
	private DiemService diemService;
	
	@RequestMapping(value = "/homepage", method = RequestMethod.GET)
	public String home(Locale locale, Model model) throws Exception{
		diemService.ghiFile();
		mf.mainMF();
		return "trangchu";
	}
	
}
