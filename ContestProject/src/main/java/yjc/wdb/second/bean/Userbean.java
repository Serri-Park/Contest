package yjc.wdb.second.bean;

import java.sql.Date;

public class Userbean {



@Override
	public String toString() {
		return "Userbean [u_id=" + u_id + ", u_pass=" + u_pass + ", u_name=" + u_name + ", u_hp=" + u_hp
				+ ", u_birthyear=" + u_birthyear + ", u_email=" + u_email + ", u_major=" + u_major
				+ ", u_post_code=" + u_postcode + ", u_address=" + u_address + ", u_address2=" + u_address2
				+ ", u_regdate=" + u_regdate + ", u_profile=" + u_profile + ", g_id=" + g_id + "]";
	}
private String u_id;
private String u_pass;
private String u_name;
private String u_hp;
private Date u_birthyear;
private String u_email;
private String u_major;
private String u_postcode;
private String u_address;
private String u_address2;
private String u_regdate;
private String u_profile;
private int g_id;
public String getU_id() {
	return u_id;
}
public void setU_id(String u_id) {
	this.u_id = u_id;
}
public String getU_pass() {
	return u_pass;
}
public void setU_pass(String u_pass) {
	this.u_pass = u_pass;
}
public String getU_name() {
	return u_name;
}
public void setU_name(String u_name) {
	this.u_name = u_name;
}
public String getU_hp() {
	return u_hp;
}
public void setU_hp(String u_hp) {
	this.u_hp = u_hp;
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
public String getU_postcode() {
	return u_postcode;
}
public void setU_postcode(String u_postcode) {
	this.u_postcode = u_postcode;
}
public String getU_address() {
	return u_address;
}
public void setU_address(String u_address) {
	this.u_address = u_address;
}
public String getU_address2() {
	return u_address2;
}
public void setU_address2(String u_address2) {
	this.u_address2 = u_address2;
}
public String getU_regdate() {
	return u_regdate;
}
public void setU_regdate(String u_regdate) {
	this.u_regdate = u_regdate;
}
public String getU_profile() {
	return u_profile;
}
public void setU_profile(String u_profile) {
	this.u_profile = u_profile;
}
public int getG_id() {
	return g_id;
}
public void setG_id(int g_id) {
	this.g_id = g_id;
}



}
