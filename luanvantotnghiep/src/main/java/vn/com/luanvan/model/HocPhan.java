package vn.com.luanvan.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
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
	
	@OneToMany(cascade = CascadeType.ALL)
	@JoinColumn(name="hocPhanId")
	private List<Diem> diems;
	
	@OneToMany(cascade = CascadeType.ALL)
	@JoinColumn(name="hocPhanId")
	private List<ChuongTrinhDaoTao> chuongTrinhs;
	
	@OneToMany(cascade = CascadeType.ALL)
	@JoinColumn(name="hocPhanId")
	private List<HocPhanTienQuyet> hocPhanTienQuyets;
	
	public List<HocPhanTienQuyet> getHocPhanTienQuyets() {
		return hocPhanTienQuyets;
	}

	public void setHocPhanTienQuyets(List<HocPhanTienQuyet> hocPhanTienQuyets) {
		this.hocPhanTienQuyets = hocPhanTienQuyets;
	}

	public List<Diem> getDiems() {
		return diems;
	}

	public void setDiems(List<Diem> diems) {
		this.diems = diems;
	}

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

	public List<ChuongTrinhDaoTao> getChuongTrinhs() {
		return chuongTrinhs;
	}

	public void setChuongTrinhs(List<ChuongTrinhDaoTao> chuongTrinhs) {
		this.chuongTrinhs = chuongTrinhs;
	}

}
