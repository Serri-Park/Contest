package yjc.wdb.second.bean;

public class Work {
	
	private int w_id;
	private Integer r_id;
	public String[] getF_name() {
		return f_name;
	}
	public void setF_name(String[] f_name) {
		this.f_name = f_name;
	}
	private String[] f_name;
	public Integer getR_id() {
		return r_id;
	}
	@Override
	public String toString() {
		return "Work [w_id=" + w_id + ", r_id=" + r_id + ", w_name=" + w_name + ", w_result=" + w_result
				+ ", w_content=" + w_content + ", getR_id()=" + getR_id() + ", getW_id()=" + getW_id()
				+ ", getW_name()=" + getW_name() + ", getW_result()=" + getW_result() + ", getW_content()="
				+ getW_content() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()="
				+ super.toString() + "]";
	}
	public void setR_id(Integer r_id) {
		this.r_id = r_id;
	}
	private String w_name;
	public int getW_id() {
		return w_id;
	}
	public void setW_id(int w_id) {
		this.w_id = w_id;
	}
	public String getW_name() {
		return w_name;
	}
	public void setW_name(String w_name) {
		this.w_name = w_name;
	}
	public int getW_result() {
		return w_result;
	}
	public void setW_result(int w_result) {
		this.w_result = w_result;
	}
	public String getW_content() {
		return w_content;
	}
	public void setW_content(String w_content) {
		this.w_content = w_content;
	}
	private int w_result;
	private String w_content;

}
