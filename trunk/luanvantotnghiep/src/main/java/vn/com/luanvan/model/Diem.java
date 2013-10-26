package vn.com.luanvan.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="diem")
public class Diem {

	@Id
	@Column(name="id")
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	private long diemId;
	
	
	public long getDiemId() {
		return diemId;
	}

	public void setDiemId(long diemId) {
		this.diemId = diemId;
	}

	private String diem;

	public String getDiem() {
		return diem;
	}

	public void setDiem(String diem) {
		this.diem = diem;
	}
	
	
}
