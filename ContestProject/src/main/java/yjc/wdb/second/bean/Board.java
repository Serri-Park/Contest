package yjc.wdb.second.bean;

import java.sql.Date;
import java.sql.Timestamp;

public class Board {
	private int b_id;
	private String u_id;
	private int bg_id;
	private String b_title;
	private String b_content;
	private Timestamp b_regdate;
	private int b_hits;
	private String[] f_name;
	private String bg_name;
	
	public int getB_id() {
		return b_id;
	}
	public void setB_id(int b_id) {
		this.b_id = b_id;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public int getBg_id() {
		return bg_id;
	}
	public void setBg_id(int bg_id) {
		this.bg_id = bg_id;
	}
	public String getB_title() {
		return b_title;
	}
	public void setB_title(String b_title) {
		this.b_title = b_title;
	}
	public String getB_content() {
		return b_content;
	}
	public void setB_content(String b_content) {
		this.b_content = b_content;
	}
	public Timestamp getB_regdate() {
		return b_regdate;
	}
	public void setB_regdate(Timestamp b_regdate) {
		this.b_regdate = b_regdate;
	}
	public int getB_hits() {
		return b_hits;
	}
	public void setB_hits(int b_hits) {
		this.b_hits = b_hits;
	}
	public String getBg_name() {
		return bg_name;
	}
	public void setBg_name(String g_name) {
		this.bg_name = g_name;
	}
	public String[] getF_name() {
		return f_name;
	}
	public void setF_name(String[] f_name) {
		this.f_name = f_name;
	}
	
}
