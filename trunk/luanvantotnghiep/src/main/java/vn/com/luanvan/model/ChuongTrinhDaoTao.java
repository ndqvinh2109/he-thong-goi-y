package vn.com.luanvan.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
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

	@ManyToOne
	@JoinColumn(name="khoaDaoTaoId")
	private KhoaDaoTao khoaDaoTao;
	
	@ManyToOne
	@JoinColumn(name="nganhId")
	private Nganh nganh;
	
	@ManyToOne
	@JoinColumn(name="hocPhanId")
	private HocPhan hocPhan;
	
	
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

	public KhoaDaoTao getKhoaDaoTao() {
		return khoaDaoTao;
	}

	public void setKhoaDaoTao(KhoaDaoTao khoaDaoTao) {
		this.khoaDaoTao = khoaDaoTao;
	}

	public Nganh getNganh() {
		return nganh;
	}

	public void setNganh(Nganh nganh) {
		this.nganh = nganh;
	}

	public HocPhan getHocPhan() {
		return hocPhan;
	}

	public void setHocPhan(HocPhan hocPhan) {
		this.hocPhan = hocPhan;
	}
}
