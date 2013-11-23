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
	
	private String diemDuDoan;

	@ManyToOne
	@JoinColumn(name="sinhVienId")
	private SinhVien sinhvien;
	
	@ManyToOne
	@JoinColumn(name="nienkhoaId")
	private NienKhoaHocKy nienKhoaHocKy;
	
	

	@ManyToOne
	@JoinColumn(name="hocPhanId")
	private HocPhan hocPhan;
	
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

	public String getDiemDuDoan() {
		return diemDuDoan;
	}

	public void setDiemDuDoan(String diemDuDoan) {
		this.diemDuDoan = diemDuDoan;
	}
	
	public NienKhoaHocKy getNienKhoaHocKy() {
		return nienKhoaHocKy;
	}

	public void setNienKhoaHocKy(NienKhoaHocKy nienKhoaHocKy) {
		this.nienKhoaHocKy = nienKhoaHocKy;
	}

	public HocPhan getHocPhan() {
		return hocPhan;
	}

	public void setHocPhan(HocPhan hocPhan) {
		this.hocPhan = hocPhan;
	}
}
