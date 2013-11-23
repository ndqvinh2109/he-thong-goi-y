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
@Table(name="lop")
public class Lop {

	@Id
	@Column(name="id")
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	private long lopId;
	
	private String maLop;
	
	private String tenLop;
	
	private int siSo;

	@OneToMany(cascade = CascadeType.ALL)
	@JoinColumn(name="lopId")
	private List<SinhVien> sinhViens;
	
	@ManyToOne
	@JoinColumn(name="khoaDaoTaoId")
	private KhoaDaoTao khoaDaoTao;
		
	@ManyToOne
	@JoinColumn(name="nganhId")
	private Nganh nganh;
	
	public List<SinhVien> getSinhViens() {
		return sinhViens;
	}

	public void setSinhViens(List<SinhVien> sinhViens) {
		this.sinhViens = sinhViens;
	}

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

	public KhoaDaoTao getKhoaDaoTao() {
		return khoaDaoTao;
	}

	public void setKhoaDaoTao(KhoaDaoTao khoaDaoTao) {
		this.khoaDaoTao = khoaDaoTao;
	}
	
	
}
