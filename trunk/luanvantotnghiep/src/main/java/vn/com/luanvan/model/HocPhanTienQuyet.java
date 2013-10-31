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
@Table(name="hocphantienquyet")
public class HocPhanTienQuyet {
	@Id
	@Column(name="id")
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	private long hocPhanTienQuyetId;
	
	private String maHocPhanTienQuyet;
	
	@ManyToOne
	@JoinColumn(name="hocPhanId")
	private HocPhan hocPhan;
	
	public long getHocPhanTienQuyetId() {
		return hocPhanTienQuyetId;
	}
	public void setHocPhanTienQuyetId(long hocPhanTienQuyetId) {
		this.hocPhanTienQuyetId = hocPhanTienQuyetId;
	}
	public String getMaHocPhanTienQuyet() {
		return maHocPhanTienQuyet;
	}
	public void setMaHocPhanTienQuyet(String maHocPhanTienQuyet) {
		this.maHocPhanTienQuyet = maHocPhanTienQuyet;
	}
	public HocPhan getHocPhan() {
		return hocPhan;
	}
	public void setHocPhan(HocPhan hocPhan) {
		this.hocPhan = hocPhan;
	}
	
}
