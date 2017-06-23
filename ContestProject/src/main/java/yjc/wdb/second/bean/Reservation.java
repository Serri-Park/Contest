package yjc.wdb.second.bean;


import java.sql.Date;



public class Reservation {
private int pr_id;


private Date pr_resdate;

private String pr_Starttime;
private String pr_endtime;
private String u_id;

private int p_id;
private String p_name;
private int p_cost;
private int pr_status;
public int getPr_id() {
	return pr_id;
}
@Override
public String toString() {
	return "Reservation [pr_id=" + pr_id + ", pr_resdate=" + pr_resdate + ", pr_Starttime=" + pr_Starttime
			+ ", pr_endtime=" + pr_endtime + ", u_id=" + u_id + ", p_id=" + p_id + ", p_name=" + p_name + ", p_cost="
			+ p_cost + ", pr_status=" + pr_status + "]";
}
public void setPr_id(int pr_id) {
	this.pr_id = pr_id;
}
public Date getPr_resdate() {
	return pr_resdate;
}
public void setPr_resdate(Date pr_resdate) {
	this.pr_resdate = pr_resdate;
}
public String getPr_Starttime() {
	return pr_Starttime;
}
public void setPr_Starttime(String pr_Starttime) {
	this.pr_Starttime = pr_Starttime;
}
public String getPr_endtime() {
	return pr_endtime;
}
public void setPr_endtime(String pr_endtime) {
	this.pr_endtime = pr_endtime;
}
public String getU_id() {
	return u_id;
}
public void setU_id(String u_id) {
	this.u_id = u_id;
}
public int getP_id() {
	return p_id;
}
public void setP_id(int p_id) {
	this.p_id = p_id;
}
public String getP_name() {
	return p_name;
}
public void setP_name(String p_name) {
	this.p_name = p_name;
}
public int getP_cost() {
	return p_cost;
}
public void setP_cost(int p_cost) {
	this.p_cost = p_cost;
}
public int getPr_status() {
	return pr_status;
}
public void setPr_status(int pr_status) {
	this.pr_status = pr_status;
}






}
