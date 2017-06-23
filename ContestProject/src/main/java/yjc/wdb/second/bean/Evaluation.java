package yjc.wdb.second.bean;


public class Evaluation {
	private int c_id;
	private String c_name;
	private String ep_stage;
	private String ep_how;
	private int ep_id;
	
	public int getEp_id() {
		return ep_id;
	}
	public void setEp_id(int ep_id) {
		this.ep_id = ep_id;
	}
	public int getC_id() {
		return c_id;
	}
	public void setC_id(int c_id) {
		this.c_id = c_id;
	}
	public String getC_name() {
		return c_name;
	}
	public void setC_name(String c_name) {
		this.c_name = c_name;
	}
	public String getEp_stage() {
		return ep_stage;
	}
	public void setEp_stage(String ep_stage) {
		this.ep_stage = ep_stage;
	}
	public String getEp_how() {
		return ep_how;
	}
	public void setEp_how(String ep_how) {
		this.ep_how = ep_how;
	}

}
