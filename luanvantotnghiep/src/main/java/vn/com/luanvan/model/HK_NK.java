package vn.com.luanvan.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="hk_nk")
public class HK_NK {
	
	@Id
	@Column(name="id")
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	private long hk_nkId;
	
	private String hocKy;
	
	private String namHoc;

	public long getHk_nkId() {
		return hk_nkId;
	}

	public void setHk_nkId(long hk_nkId) {
		this.hk_nkId = hk_nkId;
	}

	public String getHocKy() {
		return hocKy;
	}

	public void setHocKy(String hocKy) {
		this.hocKy = hocKy;
	}

	public String getNamHoc() {
		return namHoc;
	}

	public void setNamHoc(String namHoc) {
		this.namHoc = namHoc;
	}

}
