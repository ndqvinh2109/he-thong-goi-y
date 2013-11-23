package vn.com.luanvan.model;


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
@Table(name="khoachuquan")
public class KhoaChuQuan {
	
	@Id
	@Column(name="id")
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	private long khoaChuQuanId;
	
	private String maKhoa;
	
	private String tenKhoa;

	@OneToMany(cascade = CascadeType.ALL)
	@JoinColumn(name="khoaChuQuanId")
	private List<BoMon> boMons;
	
	public long getKhoaChuQuanId() {
		return khoaChuQuanId;
	}

	public void setKhoaChuQuanId(long khoaChuQuanId) {
		this.khoaChuQuanId = khoaChuQuanId;
	}

	public String getMaKhoa() {
		return maKhoa;
	}

	public void setMaKhoa(String maKhoa) {
		this.maKhoa = maKhoa;
	}

	public String getTenKhoa() {
		return tenKhoa;
	}

	public void setTenKhoa(String tenKhoa) {
		this.tenKhoa = tenKhoa;
	}
	
	public List<BoMon> getBoMons() {
		return boMons;
	}

	public void setBoMons(List<BoMon> boMons) {
		this.boMons = boMons;
	}
}
