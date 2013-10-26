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
@Table(name="nganh")
public class Nganh {

	@Id
	@Column(name="id")
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	private long nganhId;
	
	private String maNganh;
	
	private String tenNganh;

	@OneToMany(cascade = CascadeType.ALL)
	@JoinColumn(name="nganhId")
	private List<ChuongTrinhDaoTao> chuongTrinhs;
	
	public long getNganhId() {
		return nganhId;
	}

	public void setNganhId(long nganhId) {
		this.nganhId = nganhId;
	}

	public String getMaNganh() {
		return maNganh;
	}

	public void setMaNganh(String maNganh) {
		this.maNganh = maNganh;
	}

	public String getTenNganh() {
		return tenNganh;
	}

	public void setTenNganh(String tenNganh) {
		this.tenNganh = tenNganh;
	}

	public List<ChuongTrinhDaoTao> getChuongTrinhs() {
		return chuongTrinhs;
	}

	public void setChuongTrinhs(List<ChuongTrinhDaoTao> chuongTrinhs) {
		this.chuongTrinhs = chuongTrinhs;
	}
	
}
