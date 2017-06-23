package yjc.wdb.second.bean;

import java.sql.Date;

public class evaluationVo {
private String id;
private int p_no;
private String replycontent;
private int point;
private Date reg_Date;
private int r_id;
public String getId() {
	return id;
}
public void setId(String id) {
	this.id = id;
}
public int getP_no() {
	return p_no;
}
public void setP_no(int p_no) {
	this.p_no = p_no;
}
public String getReplycontent() {
	return replycontent;
}
public void setReplycontent(String replycontent) {
	this.replycontent = replycontent;
}
public int getPoint() {
	return point;
}
public void setPoint(int point) {
	this.point = point;
}

public Date getReg_Date() {
	return reg_Date;
}
public void setReg_Date(Date reg_Date) {
	this.reg_Date = reg_Date;
}
@Override
public String toString() {
	return "evaluationVo [id=" + id + ", p_no=" + p_no + ", replycontent=" + replycontent + ", point=" + point + "]";
}
public int getR_id() {
	return r_id;
}
public void setR_id(int r_id) {
	this.r_id = r_id;
}
}
