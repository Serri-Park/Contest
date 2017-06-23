package yjc.wdb.second.bean;

import java.sql.Date;

public class BoardReply {

	private int bc_id;
	private int b_id;
	private String bc_content;
	private String u_id;
	private Date bc_regdate;
	
	public String toString() {
		return "(bc_id:"+bc_id+", b_id:"+b_id+", b_content:"+bc_content+", u_id:"+u_id+")";
	}

	public int getBc_id() {
		return bc_id;
	}

	public void setBc_id(int bc_id) {
		this.bc_id = bc_id;
	}

	public int getB_id() {
		return b_id;
	}

	public void setB_id(int b_id) {
		this.b_id = b_id;
	}

	public String getBc_content() {
		return bc_content;
	}

	public void setBc_content(String b_content) {
		this.bc_content = b_content;
	}

	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
	}

	public Date getBc_regdate() {
		return bc_regdate;
	}

	public void setBc_regdate(Date bc_regdate) {
		this.bc_regdate = bc_regdate;
	}
}
