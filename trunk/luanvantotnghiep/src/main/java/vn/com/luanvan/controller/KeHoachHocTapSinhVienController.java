package vn.com.luanvan.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import vn.com.luanvan.model.Diem;
import vn.com.luanvan.model.KhoaDaoTao;
import vn.com.luanvan.model.Nganh;
import vn.com.luanvan.model.NienKhoaHocKy;
import vn.com.luanvan.model.SinhVien;
import vn.com.luanvan.service.DiemService;
import vn.com.luanvan.service.HocPhanService;
import vn.com.luanvan.service.KhoaDaoTaoService;
import vn.com.luanvan.service.NganhService;
import vn.com.luanvan.service.NienKhoaHocKyService;
import vn.com.luanvan.service.SinhVienService;
import vn.com.luanvan.utils.Utils;

@Controller
public class KeHoachHocTapSinhVienController {
	
	@Autowired
	private Utils utils;
	@Autowired
	private SinhVienService sinhVienService;
	@Autowired
	private HocPhanService hocPhanService;
	@Autowired
	private NganhService nganhService;
	@Autowired
	private KhoaDaoTaoService khoaDaoTaoService;
	@Autowired
	private NienKhoaHocKyService nienKhoaHocKyService;
	@Autowired
	private DiemService diemService;
	
	@RequestMapping(value="khhtsinhvien", method = RequestMethod.GET)
	public String loadPageKeHoachHocTapSinhVien(Map<String,Object> map){
		
		String loggedInMember = utils.getLoggedInMember();
		SinhVien sinhVien = sinhVienService.findSinhVienByMaSinhVien(loggedInMember);
		Nganh nganh = new Nganh();
		KhoaDaoTao khoaDaoTao = new KhoaDaoTao();
		if(sinhVien != null){
			long sinhVienId = sinhVien.getSinhVienId();
			nganh = nganhService.findNganhBySinhVienId(sinhVienId);
			khoaDaoTao = khoaDaoTaoService.findKhoaDaoTaoBySinhVienId(sinhVienId);
			loggedInMember = sinhVien.getHoTen();
		}
		
		map.put("nganh", nganh);
		map.put("khoaDaoTao", khoaDaoTao);
		map.put("tenSinhVien", loggedInMember);
		return "kehoachhoctapsinhvien";
	}
	
	@RequestMapping(value="loadDuDoanDiemChoSinhVien", method=RequestMethod.GET)
	public @ResponseBody Map<String, Object> loadDuDoanDiemChoSinhVien(){
		Map<String,Object> map = new HashMap<String,Object>();
		String loggedMember = utils.getLoggedInMember();
		SinhVien sinhVien = sinhVienService.findSinhVienByMaSinhVien(loggedMember);
		List<Object[]> hps = new ArrayList<Object[]>();
		if(sinhVien != null){
			hps = hocPhanService.findHocPhanBySinhVienIdAndNienKhoaId(sinhVien.getSinhVienId());
		}
		map.put("danhSachDiemHocPhan", hps);
		return map;
	}
	
	@RequestMapping(value="exportDiem", method=RequestMethod.GET)
	public ModelAndView exportDiem(){
		String loggedMember = utils.getLoggedInMember();
		SinhVien sinhVien = sinhVienService.findSinhVienByMaSinhVien(loggedMember);
		List<Object[]> hps = new ArrayList<Object[]>();
		if(sinhVien != null){
			hps = hocPhanService.findHocPhanBySinhVienIdAndNienKhoaId(sinhVien.getSinhVienId());
		}
		
		return new ModelAndView("exportDiemPDF", "danhSachDiemHocPhan", hps);
	}
	
	
	
	@RequestMapping(value="updateHocKyNamHoc", method=RequestMethod.GET)
	public @ResponseBody boolean updateHocKyNamHoc(
			@RequestParam(value="hocki", required = false) String hocki,
			@RequestParam(value="namhoc", required = false) String namhoc,
			@RequestParam(value="diemId", required = false) long diemId){
		
		NienKhoaHocKy nk = nienKhoaHocKyService.findNienKhoaHocKyByHocKyAndNienKhoa(hocki, namhoc);
		Diem diem = diemService.findDiemById(diemId);
		diem.setNienKhoaHocKy(nk);
		return diemService.updateDiem(diem);
	}
	
}
