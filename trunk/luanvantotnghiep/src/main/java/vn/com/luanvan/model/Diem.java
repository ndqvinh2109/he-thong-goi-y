package vn.com.luanvan.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="diem")
public class Diem {

	@Id
	@Column(name="id")
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	private long diemId;
	
	private String diem;

	@ManyToOne
	@JoinColumn(name="sinhVienId")
	private SinhVien sinhvien;
	
	
	public long getDiemId() {
		return diemId;
	}

	public void setDiemId(long diemId) {
		this.diemId = diemId;
	}

	
	public String getDiem() {
		return diem;
	}

	public void setDiem(String diem) {
		this.diem = diem;
	}

	public SinhVien getSinhvien() {
		return sinhvien;
	}

	public void setSinhvien(SinhVien sinhvien) {
		this.sinhvien = sinhvien;
	}
	
	
}
