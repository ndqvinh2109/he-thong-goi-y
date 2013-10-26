package vn.com.luanvan.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="nienkhoahocky")
public class NienKhoaHocKy {
	
	@Id
	@Column(name="id")
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	private long nienkhoaId;
	
	private String hocKy;
	
	private String namHoc;

	public long getNienkhoaId() {
		return nienkhoaId;
	}

	public void setNienkhoaId(long nienkhoaId) {
		this.nienkhoaId = nienkhoaId;
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
