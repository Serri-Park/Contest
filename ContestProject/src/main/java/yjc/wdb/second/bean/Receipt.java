package yjc.wdb.second.bean;

import java.sql.Timestamp;

public class Receipt {
	
	
	
	private Integer r_id;
	private Timestamp r_regdate;
	public Integer getR_id() {
		return r_id;
	}
	public void setR_id(Integer r_id) {
		this.r_id = r_id;
	}
	public Timestamp getR_regdate() {
		return r_regdate;
	}
	public void setR_regdate(Timestamp r_regdate) {
		this.r_regdate = r_regdate;
	}
	public int getT_id() {
		return t_id;
	}
	public void setT_id(Integer t_id) {
		this.t_id = t_id;
	}
	public int getC_id() {
		return c_id;
	}
	public void setC_id(Integer c_id) {
		this.c_id = c_id;
	}
	
	private Integer t_id;
	private Integer c_id;
	

}
