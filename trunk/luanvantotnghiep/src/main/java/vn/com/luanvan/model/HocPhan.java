package vn.com.luanvan.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="hocphan")
public class HocPhan {
	@Id
	@Column(name="id")
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	private long hocPhanId;
	
	private String maHP;
	
	private String tenHP;
	

	private int soTC;
	
	private int soTietLT;
	
	private int soTietTH;
	
	public long getHocPhanId() {
		return hocPhanId;
	}

	public void setHocPhanId(long hocPhanId) {
		this.hocPhanId = hocPhanId;
	}
	
	public String getMaHP() {
		return maHP;
	}

	public void setMaHP(String maHP) {
		this.maHP = maHP;
	}

	public String getTenHP() {
		return tenHP;
	}

	public void setTenHP(String tenHP) {
		this.tenHP = tenHP;
	}

	public int getSoTC() {
		return soTC;
	}

	public void setSoTC(int soTC) {
		this.soTC = soTC;
	}

	public int getSoTietLT() {
		return soTietLT;
	}

	public void setSoTietLT(int soTietLT) {
		this.soTietLT = soTietLT;
	}

	public int getSoTietTH() {
		return soTietTH;
	}

	public void setSoTietTH(int soTietTH) {
		this.soTietTH = soTietTH;
	}


}
