package yjc.wdb.second.bean;

public class Schedule {
	private String s_title;
	private int s_id;
	private String u_id;
	private String s_content;
	private String s_start;
	private String s_end;
	private int seq_schedule;
	private Integer t_id;
	private int c_id;
	private int s_category;
	private String s_color;
	private int s_going;
	private int m_id;
	private String c_name;
	public String getS_title() {
		return s_title;
	}
	public void setS_title(String s_title) {
		this.s_title = s_title;
	}
	public int getS_id() {
		return s_id;
	}
	public void setS_id(int s_id) {
		this.s_id = s_id;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
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
	public int getSeq_schedule() {
		return seq_schedule;
	}
	public void setSeq_schedule(int seq_schedule) {
		this.seq_schedule = seq_schedule;
	}
	public Integer getT_id() {
		return t_id;
	}
	public void setT_id(Integer t_id) {
		this.t_id = t_id;
	}
	@Override
	public String toString() {
		return "Schedule [s_title=" + s_title + ", s_id=" + s_id + ", u_id=" + u_id + ", s_content=" + s_content
				+ ", s_start=" + s_start + ", s_end=" + s_end + ", seq_schedule=" + seq_schedule + ", t_id=" + t_id
				+ ", c_id=" + c_id + ", s_category=" + s_category + ", s_color=" + s_color + ", s_going=" + s_going
				+ ", m_id=" + m_id + ", c_name=" + c_name + ", getS_title()=" + getS_title() + ", getS_id()="
				+ getS_id() + ", getU_id()=" + getU_id() + ", getS_content()=" + getS_content() + ", getS_start()="
				+ getS_start() + ", getS_end()=" + getS_end() + ", getSeq_schedule()=" + getSeq_schedule()
				+ ", getT_id()=" + getT_id() + ", getC_id()=" + getC_id() + ", getS_category()=" + getS_category()
				+ ", getS_color()=" + getS_color() + ", getS_going()=" + getS_going() + ", getM_id()=" + getM_id()
				+ ", getC_name()=" + getC_name() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
				+ ", toString()=" + super.toString() + "]";
	}
	public int getC_id() {
		return c_id;
	}
	public void setC_id(int c_id) {
		this.c_id = c_id;
	}
	public int getS_category() {
		return s_category;
	}
	public void setS_category(int s_category) {
		this.s_category = s_category;
	}
	public String getS_color() {
		return s_color;
	}
	public void setS_color(String s_color) {
		this.s_color = s_color;
	}
	public int getS_going() {
		return s_going;
	}
	public void setS_going(int s_going) {
		this.s_going = s_going;
	}
	public int getM_id() {
		return m_id;
	}
	public void setM_id(int m_id) {
		this.m_id = m_id;
	}
	public String getC_name() {
		return c_name;
	}
	public void setC_name(String c_name) {
		this.c_name = c_name;
	}
	
	

}
