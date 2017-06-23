package yjc.wdb.second.bean;

import java.sql.Timestamp;

public class Contest {
	private int c_id;
	private String c_name;
	private String c_category;
	private String c_content;
	private String c_host;
	private String c_target;
	private String c_homepage;
	private String c_poster;
	private String c_prize;
	private int c_viewcnt;
	private Timestamp c_startdate;
	private Timestamp c_enddate;
	private Timestamp c_regdate;
	private String[] f_name;
	private int t_id;
	
	public String getC_name() {
		return c_name;
	}
	public void setC_name(String c_name) {
		this.c_name = c_name;
	}
	public String getC_category() {
		return c_category;
	}
	public void setC_category(String c_category) {
		this.c_category = c_category;
	}
	public String getC_content() {
		return c_content;
	}
	public void setC_content(String c_content) {
		this.c_content = c_content;
	}
	public String getC_host() {
		return c_host;
	}
	public void setC_host(String c_host) {
		this.c_host = c_host;
	}
	public String getC_target() {
		return c_target;
	}
	public void setC_target(String c_target) {
		this.c_target = c_target;
	}
	public String getC_homepage() {
		return c_homepage;
	}
	public void setC_homepage(String c_homepage) {
		this.c_homepage = c_homepage;
	}
	public String getC_poster() {
		return c_poster;
	}
	public void setC_poster(String c_poster) {
		this.c_poster = c_poster;
	}
	public String getC_prize() {
		return c_prize;
	}
	public void setC_prize(String c_prize) {
		this.c_prize = c_prize;
	}
	public int getC_viewcnt() {
		return c_viewcnt;
	}
	public void setC_viewcnt(int c_viewcnt) {
		this.c_viewcnt = c_viewcnt;
	}
	public Timestamp getC_startdate() {
		return c_startdate;
	}
	public void setC_startdate(Timestamp c_startdate) {
		this.c_startdate = c_startdate;
	}
	public Timestamp getC_enddate() {
		return c_enddate;
	}
	public void setC_enddate(Timestamp c_enddate) {
		this.c_enddate = c_enddate;
	}
	public Timestamp getC_regdate() {
		return c_regdate;
	}
	public void setC_regdate(Timestamp c_regdate) {
		this.c_regdate = c_regdate;
	}
	public String[] getF_name() {
		return f_name;
	}
	public void setF_name(String[] files) {
		this.f_name = files;
	}
	public int getT_id() {
		return t_id;
	}
	public void setT_id(int t_id) {
		this.t_id = t_id;
	}
	public int getC_id() {
		return c_id;
	}
	public void setC_id(int c_id) {
		this.c_id = c_id;
	}
	public String getStart() {
		return c_startdate.toString().replace(' ', 'T').substring(0, c_startdate.toString().lastIndexOf(":"));	
	}
	public String getEnd() {
		return c_enddate.toString().replace(' ', 'T').substring(0, c_enddate.toString().lastIndexOf(":"));
	}

}
