package yjc.wdb.second.bean;

import java.sql.Date;

public class ClaimantVo {
	
	//user table + teamMember table
	private String u_name;
	private String u_address;
	private Date u_birthyear;
	private String u_email;
	private String u_major;
	private int m_rights;
	private int t_id;
	private Date m_regdate;
	private String u_id;
	public String getU_name() {
		return u_name;
	}
	public void setU_name(String u_name) {
		this.u_name = u_name;
	}
	public String getU_address() {
		return u_address;
	}
	public void setU_address(String u_address) {
		this.u_address = u_address;
	}
	public Date getU_birthyear() {
		return u_birthyear;
	}
	public void setU_birthyear(Date u_birthyear) {
		this.u_birthyear = u_birthyear;
	}
	public String getU_email() {
		return u_email;
	}
	public void setU_email(String u_email) {
		this.u_email = u_email;
	}
	public String getU_major() {
		return u_major;
	}
	public void setU_major(String u_major) {
		this.u_major = u_major;
	}
	public int getM_rights() {
		return m_rights;
	}
	public void setM_rights(int m_rights) {
		this.m_rights = m_rights;
	}
	public int getT_id() {
		return t_id;
	}
	public void setT_id(int t_id) {
		this.t_id = t_id;
	}
	public Date getM_regdate() {
		return m_regdate;
	}
	public void setM_regdate(Date m_regdate) {
		this.m_regdate = m_regdate;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
//////////////////////////////
	//t_id �넁
	
	//contest + receipt +team
	private int c_id;
	private String c_name;
	private String c_category;
	private String c_host;
	private String c_target;
	private String c_prize;
	private String c_homepage;
	private String c_content;
	private int c_viewcnt;
	private Date c_startdate;
	private Date c_enddate;
	private Date c_regdate;
	private String c_poster;
	
	private int r_id;
	private Date r_regdate;
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
	public String getC_category() {
		return c_category;
	}
	public void setC_category(String c_category) {
		this.c_category = c_category;
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
	public String getC_prize() {
		return c_prize;
	}
	public void setC_prize(String c_prize) {
		this.c_prize = c_prize;
	}
	public String getC_homepage() {
		return c_homepage;
	}
	public void setC_homepage(String c_homepage) {
		this.c_homepage = c_homepage;
	}
	public String getC_content() {
		return c_content;
	}
	public void setC_content(String c_content) {
		this.c_content = c_content;
	}
	public int getC_viewcnt() {
		return c_viewcnt;
	}
	public void setC_viewcnt(int c_viewcnt) {
		this.c_viewcnt = c_viewcnt;
	}
	public Date getC_startdate() {
		return c_startdate;
	}
	public void setC_startdate(Date c_startdate) {
		this.c_startdate = c_startdate;
	}
	public Date getC_enddate() {
		return c_enddate;
	}
	public void setC_enddate(Date c_enddate) {
		this.c_enddate = c_enddate;
	}
	public Date getC_regdate() {
		return c_regdate;
	}
	public void setC_regdate(Date c_regdate) {
		this.c_regdate = c_regdate;
	}
	public String getC_poster() {
		return c_poster;
	}
	public void setC_poster(String c_poster) {
		this.c_poster = c_poster;
	}
	public int getR_id() {
		return r_id;
	}
	public void setR_id(int r_id) {
		this.r_id = r_id;
	}
	public Date getR_regdate() {
		return r_regdate;
	}
	public void setR_regdate(Date r_regdate) {
		this.r_regdate = r_regdate;
	}
	
	
	//schedule
	private int s_id;
	private String s_title;
	private String s_content;
	private String s_start;
	private String s_end;
	private Date s_regdate;
	private int s_going;
	private String s_color;
	public int getS_id() {
		return s_id;
	}
	public void setS_id(int s_id) {
		this.s_id = s_id;
	}
	public String getS_title() {
		return s_title;
	}
	public void setS_title(String s_title) {
		this.s_title = s_title;
	}
	public String getS_content() {
		return s_content;
	}
	public void setS_content(String s_content) {
		this.s_content = s_content;
	}
	public String getS_start() {
		return s_start;
	}
	public void setS_start(String s_start) {
		this.s_start = s_start;
	}
	public String getS_end() {
		return s_end;
	}
	public void setS_end(String s_end) {
		this.s_end = s_end;
	}
	public Date getS_regdate() {
		return s_regdate;
	}
	public void setS_regdate(Date s_regdate) {
		this.s_regdate = s_regdate;
	}
	public int getS_going() {
		return s_going;
	}
	public void setS_going(int s_going) {
		this.s_going = s_going;
	}
	public String getS_color() {
		return s_color;
	}
	public void setS_color(String s_color) {
		this.s_color = s_color;
	}
	
	
	
}
