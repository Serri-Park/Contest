package yjc.wdb.second.bean;

public class Manager {
	private int te_score;
	private String u_id;
	//receipt ���̺�
	private int c_id;
	private int t_id;
	private int r_id;
	//work ���̺�
	private int w_id;
	private String w_name;
	private int w_result;
	//evaluation ���̺�
	private int e_id;
	private int e_score;
	private int el_id;
	private String el_name;
	private int el_score;
	private int e_user_id;
	//evalPage ���̺�
	private int ep_stage;
	private int ep_id;
	
	private String ep_how;
	//file ���̺�
	private String f_name;
	private int allCnt;
	private String grande;
	private String t_name;
	private int ep_state;
	private int startNum;
	private int endNum = 1;
	private int m_count;
	private int stage;
	
	
	public int getTe_score() {
		return te_score;
	}

	public void setTe_score(int te_score) {
		this.te_score = te_score;
	}

	public String getEl_name() {
		return el_name;
	}

	public void setEl_name(String el_name) {
		this.el_name = el_name;
	}

	public int getEl_score() {
		return el_score;
	}

	public void setEl_score(int el_score) {
		this.el_score = el_score;
	}

	public int getStage() {
		return stage;
	}

	public void setStage(int stage) {
		this.stage = stage;
	}

	public int getM_count() {
		return m_count;
	}

	public void setM_count(int m_count) {
		this.m_count = m_count;
	}

	public int getAllCnt() {
		return allCnt;
	}

	public void setAllCnt(int allCnt) {
		this.allCnt = allCnt;
	}

	public int getStartNum() {
		return startNum;
	}

	public void setStartNum(int startNum) {
		this.startNum = startNum;
	}

	public int getEndNum() {
		return endNum;
	}

	public void setEndNum(int endNum) {
		this.endNum = endNum;
	}

	public int getEp_state() {
		return ep_state;
	}

	public void setEp_state(int ep_state) {
		this.ep_state = ep_state;
	}

	public String toString(){
		return "(ep_how:"+ep_how+")";
	}
	
	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
	}

	public int getEp_id() {
		return ep_id;
	}

	public void setEp_id(int ep_id) {
		this.ep_id = ep_id;
	}

	public int getC_id() {
		return c_id;
	}

	public void setC_id(int c_id) {
		this.c_id = c_id;
	}

	public int getT_id() {
		return t_id;
	}

	public void setT_id(int t_id) {
		this.t_id = t_id;
	}

	public int getR_id() {
		return r_id;
	}

	public void setR_id(int r_id) {
		this.r_id = r_id;
	}

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

	public int getE_id() {
		return e_id;
	}

	public void setE_id(int e_id) {
		this.e_id = e_id;
	}

	public int getE_score() {
		return e_score;
	}

	public void setE_score(int score) {
		this.e_score = score;
	}

	public int getEl_id() {
		return el_id;
	}

	public void setEl_id(int el_id) {
		this.el_id = el_id;
	}

	public int getE_user_id() {
		return e_user_id;
	}

	public void setE_user_id(int e_user_id) {
		this.e_user_id = e_user_id;
	}

	public int getEp_stage() {
		return ep_stage;
	}

	public void setEp_stage(int ep_stage) {
		this.ep_stage = ep_stage;
	}

	public String getEp_how() {
		return ep_how;
	}

	public void setEp_how(String ep_how) {
		this.ep_how = ep_how;
	}


	public String getF_name() {
		return f_name;
	}

	public void setF_name(String f_name) {
		this.f_name = f_name;
	}

	public String getGrande() {
		return grande;
	}

	public void setGrande(String grande) {
		this.grande = grande;
	}

	public String getT_name() {
		return t_name;
	}

	public void setT_name(String t_name) {
		this.t_name = t_name;
	}

	
	
}
