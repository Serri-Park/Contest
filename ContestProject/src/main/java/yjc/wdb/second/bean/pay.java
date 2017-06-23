package yjc.wdb.second.bean;

import java.sql.Date;

public class pay {

	private int pr_id;
	private int paykind;
	private int payStatus;
	private Date pay_date;
	private String u_id;
	
	public int getPr_id() {
		return pr_id;
	}

	public void setPr_id(int pr_id) {
		this.pr_id = pr_id;
	}

	public int getPaykind() {
		return paykind;
	}

	public void setPaykind(int paykind) {
		this.paykind = paykind;
	}

	public int getPayStatus() {
		return payStatus;
	}

	public void setPay_Status(int payStatus) {
		this.payStatus = payStatus;
	}

	public Date getPay_date() {
		return pay_date;
	}

	public void setPay_date(Date pay_date) {
		this.pay_date = pay_date;
	}

	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
	}

	@Override
	public String toString() {
		return "pay [pr_id=" + pr_id + ", paykind=" + paykind + ", payStatus=" + payStatus + ", pay_date=" + pay_date
				+ ", u_id=" + u_id + "]";
	}
	
}
