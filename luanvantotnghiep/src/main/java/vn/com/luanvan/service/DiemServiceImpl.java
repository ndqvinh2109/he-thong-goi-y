package vn.com.luanvan.service;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import vn.com.luanvan.dao.DiemDao;
import vn.com.luanvan.model.Diem;
import vn.com.luanvan.utils.Utils;

@Service
@Transactional
public class DiemServiceImpl implements DiemService{

	@Autowired
	private DiemDao diemDao;
	
	@Override
	public boolean saveDiem(Diem diem) {
		return diemDao.saveDiem(diem);
	}

	@Override
	public boolean updateDiem(Diem diem) {
		return diemDao.updateDiem(diem);
	}

	@Override
	public boolean deleteDiem(long id) {
		return diemDao.deleteDiem(id);
	}

	@Override
	public List<Diem> findAllDiem() {
		return diemDao.findAllDiem();
	}

	@Override
	public Diem findDiemById(long Id) {
		return diemDao.findDiemById(Id);
	}

	@Override
	public int updateDiemByDiemIdAndHocPhanIdAndSinhVienId(long diemId,
			String diemDuDoan) {
		
		return diemDao.updateDiemByDiemIdAndHocPhanIdAndSinhVienId(diemId, diemDuDoan);
	}

	@Override
	public void ghiFile() {
		String currentDir = Utils.getConfigParam("luanvan.data.root.location");
		String fnPredictor = currentDir + "/assistment_predictors_kc.txt"; // studentID as user, SkillID as item, correct as rating
    	String fnTarget = currentDir + "/assistment_target.txt";
    	String fnSplit = currentDir + "/assistment_split.txt";
    	String fnDiem = currentDir + "/assistment_diemid.txt";
		List<Diem> listDiem = findAllDiem();
		File file;
		FileWriter fw;
		BufferedWriter bw;
		try {
			// Ghi file fnPredictor
			file = new File(fnPredictor);
			if (!file.exists()) {
				file.createNewFile();
			}
			fw = new FileWriter(file.getAbsoluteFile());
			bw = new BufferedWriter(fw);
			bw.write(String.valueOf(listDiem.size()) + "\t2");
			bw.newLine();
			for(Diem diem : listDiem){
				String sinhvienId = String.valueOf(diem.getSinhvien().getSinhVienId());
				String hocPhanId = String.valueOf(diem.getHocPhan().getHocPhanId());
				String content = sinhvienId + "\t" + hocPhanId;
				bw.write(content);
				bw.newLine();
			}
			bw.close();
			
			//Ghi file fnTarget
			
			file = new File(fnTarget);
			if (!file.exists()) {
				file.createNewFile();
			}
			fw = new FileWriter(file.getAbsoluteFile());
			bw = new BufferedWriter(fw);
			bw.write(String.valueOf(listDiem.size()));
			bw.newLine();
			
			for(Diem diem : listDiem){
				if(diem.getDiem().equals("")){
					bw.write("-1");
					bw.newLine();
				}
				else{
					float diemTemp = Float.parseFloat(diem.getDiem());
					if(diemTemp >= 8.5f){
						bw.write("4");
						bw.newLine();
					}
					else if(diemTemp >= 8f && diemTemp <= 8.4f){
						bw.write("3.5");
						bw.newLine();
					}
					else if(diemTemp >= 7f && diemTemp <= 7.9f){
						bw.write("3");
						bw.newLine();
					}
					else if(diemTemp >= 6.5f && diemTemp <= 6.9f){
						bw.write("2.5");
						bw.newLine();
					}
					else if(diemTemp >= 5.5f && diemTemp <= 6.4f){
						bw.write("2");
						bw.newLine();
					}
					else if(diemTemp >= 5f && diemTemp <= 5.4f){
						bw.write("1");
						bw.newLine();
					}	
					else{
						bw.write("0");
						bw.newLine();
					}
				}
			}
			
			bw.close();
			
			//Ghi file fnSplit
			file = new File(fnSplit);
			if (!file.exists()) {
				file.createNewFile();
			}
			fw = new FileWriter(file.getAbsoluteFile());
			bw = new BufferedWriter(fw);
			bw.write(String.valueOf(listDiem.size()));
			bw.newLine();
			for(Diem diem : listDiem){
				if(diem.getDiem().equals("")){
					bw.write("1");
					bw.newLine();
				}
				else{
					bw.write("0");
					bw.newLine();
				}
			}
			
			bw.close();
			
			//Ghi file fnDiem
			file = new File(fnDiem);
			if (!file.exists()) {
				file.createNewFile();
			}
			fw = new FileWriter(file.getAbsoluteFile());
			bw = new BufferedWriter(fw);
			bw.write(String.valueOf(listDiem.size()));
			bw.newLine();
			for(Diem diem : listDiem){
				String diemId = String.valueOf(diem.getDiemId());
				bw.write(diemId);
				bw.newLine();
			}
			
			bw.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		 
	}

}
