package vn.com.luanvan.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
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
	
	
}
