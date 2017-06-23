package yjc.wdb.second.bean;

import java.sql.Date;
import java.sql.Timestamp;


public class PlaceVo {
private Integer p_id;
private String p_picture;

public Integer getP_id() {
	return p_id;
}
public void setP_id(Integer p_id) {
	this.p_id = p_id;
}
public String getP_name() {
	return p_name;
}
public void setP_name(String p_name) {
	this.p_name = p_name;
}
public String getP_Content() {
	return p_Content;
}
public void setP_Content(String p_Content) {
	this.p_Content = p_Content;
}
public String getP_Kind() {
	return p_Kind;
}
public void setP_Kind(String p_Kind) {
	this.p_Kind = p_Kind;
}
public String getP_address() {
	return P_address;
}
public void setP_address(String p_address) {
	P_address = p_address;
}
public String getP_cost() {
	return p_cost;
}
public void setP_cost(String p_cost) {
	this.p_cost = p_cost;
}
public float getP_lat() {
	return p_lat;
}
public void setP_lat(float p_lat) {
	this.p_lat = p_lat;
}
public float getP_lng() {
	return p_lng;
}
public void setp_lng(float p_lng) {
	this.p_lng = p_lng;
}
public String getP_option() {
	return p_option;
}
public void setP_option(String p_option) {
	this.p_option = p_option;
}
public Timestamp getReg_date() {
	return p_regdate;
}
public void setReg_date(Timestamp p_regdate) {
	this.p_regdate = p_regdate;
}
public String getU_id() {
	return u_id;
}
public void setU_id(String u_id) {
	this.u_id = u_id;
}
private String p_name;
private String p_Content;
private String p_Kind;
private String P_address;
private String p_cost;
private float p_lat;
private float p_lng;

public String getP_picture() {
	return p_picture;
}
public void setP_picture(String p_picture) {
	this.p_picture = p_picture;
}
private String p_option;
private	 Timestamp  p_regdate;
private String u_id;
@Override
public String toString() {
	return "PlaceVo [p_id=" + p_id + ", photos=" + p_picture + ", p_name=" + p_name + ", p_Content=" + p_Content
			+ ", p_Kind=" + p_Kind + ", P_address=" + P_address + ", p_cost=" + p_cost + ", lat=" + p_lat + ", lng=" + p_lng
			+ ", p_option=" + p_option + ", reg_date=" + p_regdate + ", u_id=" + u_id + "]";
}


}
