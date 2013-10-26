package vn.com.luanvan.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="chuongtrinhdaotao")
public class ChuongTrinhDaoTao {

	@Id
	@Column(name="id")
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	private long chuongTrinhDaoTaoId;
	
	private String tuChon;
	
	private String nhomTuChon;
	
	private String khoiKienThuc;

	
	public String getTuChon() {
		return tuChon;
	}

	public void setTuChon(String tuChon) {
		this.tuChon = tuChon;
	}

	public String getKhoiKienThuc() {
		return khoiKienThuc;
	}

	public void setKhoiKienThuc(String khoiKienThuc) {
		this.khoiKienThuc = khoiKienThuc;
	}

	public long getChuongTrinhDaoTaoId() {
		return chuongTrinhDaoTaoId;
	}

	public void setChuongTrinhDaoTaoId(long chuongTrinhDaoTaoId) {
		this.chuongTrinhDaoTaoId = chuongTrinhDaoTaoId;
	}

	public String getNhomTuChon() {
		return nhomTuChon;
	}

	public void setNhomTuChon(String nhomTuChon) {
		this.nhomTuChon = nhomTuChon;
	}
}
