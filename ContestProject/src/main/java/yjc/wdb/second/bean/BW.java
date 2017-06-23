package yjc.wdb.second.bean;

import java.sql.Date;

public class BW {
	private int bw_id;
	private String bw_sub;
	private Date bw_time;
	private String bw_timer;
	private int bw_pagenum;
	private int t_id;
	
	public int getBw_id() {
		return bw_id;
	}
	public void setBw_id(int bw_id) {
		this.bw_id = bw_id;
	}
	public String getBw_sub() {
		return bw_sub;
	}
	public void setBw_sub(String bw_sub) {
		this.bw_sub = bw_sub;
	}
	public Date getBw_time() {
		return bw_time;
	}
	public void setBw_time(Date bw_time) {
		this.bw_time = bw_time;
	}
	public String getBw_timer() {
		return bw_timer;
	}
	public void setBw_timer(String bw_timer) {
		this.bw_timer = bw_timer;
	}
	public int getBw_pagenum() {
		return bw_pagenum;
	}
	public void setBw_pagenum(int bw_pagenum) {
		this.bw_pagenum = bw_pagenum;
	}
	public int getT_id() {
		return t_id;
	}
	public void setT_id(int t_id) {
		this.t_id = t_id;
	}

	
}
