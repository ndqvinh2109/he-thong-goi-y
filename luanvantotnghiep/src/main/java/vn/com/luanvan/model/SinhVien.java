package vn.com.luanvan.model;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="sinhvien")
public class SinhVien {
	
	@Id
	@Column(name ="id")
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	private long sinhVienId;
	
	private String maSoSinhVien;
	
	private String hoTen;
	
	private int phai;
	
	private Date ngaySinh;
	
	private String diaChi;
	
	private String email;

	@OneToMany(cascade = CascadeType.ALL)
	@JoinColumn(name="sinhVienId")
	private List<Diem> diems;
	
	public long getSinhVienId() {
		return sinhVienId;
	}

	public void setSinhVienId(long sinhVienId) {
		this.sinhVienId = sinhVienId;
	}

	public String getMaSoSinhVien() {
		return maSoSinhVien;
	}

	public void setMaSoSinhVien(String maSoSinhVien) {
		this.maSoSinhVien = maSoSinhVien;
	}

	public String getHoTen() {
		return hoTen;
	}

	public void setHoTen(String hoTen) {
		this.hoTen = hoTen;
	}

	public int getPhai() {
		return phai;
	}

	public void setPhai(int phai) {
		this.phai = phai;
	}

	public Date getNgaySinh() {
		return ngaySinh;
	}

	public void setNgaySinh(Date ngaySinh) {
		this.ngaySinh = ngaySinh;
	}

	public String getDiaChi() {
		return diaChi;
	}

	public void setDiaChi(String diaChi) {
		this.diaChi = diaChi;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public List<Diem> getDiems() {
		return diems;
	}

	public void setDiems(List<Diem> diems) {
		this.diems = diems;
	}
	
	
	
}
