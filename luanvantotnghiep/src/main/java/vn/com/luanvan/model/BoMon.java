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
@Table(name="bomon")
public class BoMon {
	
	@Id
	@Column(name="id")
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	private long boMonId;
	
	private String maBoMon;
	
	private String tenBoMon;

	@ManyToOne
	@JoinColumn(name="khoaChuQuanId")
	private KhoaChuQuan khoaChuQuan;
	
	@OneToMany(cascade = CascadeType.ALL)
	@JoinColumn(name="boMonId")
	private List<Nganh> nganhs;
	
	public long getBoMonId() {
		return boMonId;
	}

	public void setBoMonId(long boMonId) {
		this.boMonId = boMonId;
	}

	public String getMaBoMon() {
		return maBoMon;
	}

	public void setMaBoMon(String maBoMon) {
		this.maBoMon = maBoMon;
	}

	public String getTenBoMon() {
		return tenBoMon;
	}

	public void setTenBoMon(String tenBoMon) {
		this.tenBoMon = tenBoMon;
	}

	public KhoaChuQuan getKhoaChuQuan() {
		return khoaChuQuan;
	}

	public void setKhoaChuQuan(KhoaChuQuan khoaChuQuan) {
		this.khoaChuQuan = khoaChuQuan;
	}

	public List<Nganh> getNganhs() {
		return nganhs;
	}

	public void setNganhs(List<Nganh> nganhs) {
		this.nganhs = nganhs;
	}
	
	
}
