package vn.com.luanvan.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="lop")
public class Lop {

	@Id
	@Column(name="id")
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	private long lopId;
	
	private String maLop;
	
	private String tenLop;
	
	private int siSo;

	public long getLopId() {
		return lopId;
	}

	public void setLopId(long lopId) {
		this.lopId = lopId;
	}

	public String getMaLop() {
		return maLop;
	}

	public void setMaLop(String maLop) {
		this.maLop = maLop;
	}

	public String getTenLop() {
		return tenLop;
	}

	public void setTenLop(String tenLop) {
		this.tenLop = tenLop;
	}

	public int getSiSo() {
		return siSo;
	}

	public void setSiSo(int siSo) {
		this.siSo = siSo;
	}
	
	
}
