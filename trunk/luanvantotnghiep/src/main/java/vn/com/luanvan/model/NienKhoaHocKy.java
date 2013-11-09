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

import org.codehaus.jackson.annotate.JsonIgnore;

@Entity
@Table(name="nienkhoahocky")
public class NienKhoaHocKy {
	
	@Id
	@Column(name="id")
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	private long nienkhoaId;
	
	private String hocKy;
	
	private String namHoc;

	@JsonIgnore
	@OneToMany(cascade = CascadeType.ALL)
	@JoinColumn(name="nienkhoaId")
	private List<Diem> diems;
	
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

	public List<Diem> getDiems() {
		return diems;
	}

	public void setDiems(List<Diem> diems) {
		this.diems = diems;
	}

}
