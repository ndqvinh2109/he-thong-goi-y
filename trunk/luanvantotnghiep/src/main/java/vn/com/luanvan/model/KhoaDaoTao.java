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
@Table(name="khoadaotao")
public class KhoaDaoTao {

	@Id
	@Column(name="id")
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	private long khoaDaoTaoId;
	
	private String khoaDT;
	
	private String namVao;

	@OneToMany(cascade = CascadeType.ALL)
	@JoinColumn(name="khoaDaoTaoId")
	private List<ChuongTrinhDaoTao> chuongTrinhs;
	
	@OneToMany(cascade = CascadeType.ALL)
	@JoinColumn(name="khoaDaoTaoId")
	private List<Lop> lops;
	
	public long getKhoaDaoTaoId() {
		return khoaDaoTaoId;
	}

	public void setKhoaDaoTaoId(long khoaDaoTaoId) {
		this.khoaDaoTaoId = khoaDaoTaoId;
	}

	public String getKhoaDT() {
		return khoaDT;
	}

	public void setKhoaDT(String khoaDT) {
		this.khoaDT = khoaDT;
	}

	public String getNamVao() {
		return namVao;
	}

	public void setNamVao(String namVao) {
		this.namVao = namVao;
	}

	public List<ChuongTrinhDaoTao> getChuongTrinhs() {
		return chuongTrinhs;
	}

	public void setChuongTrinhs(List<ChuongTrinhDaoTao> chuongTrinhs) {
		this.chuongTrinhs = chuongTrinhs;
	}

	public List<Lop> getLops() {
		return lops;
	}

	public void setLops(List<Lop> lops) {
		this.lops = lops;
	}
	
}
