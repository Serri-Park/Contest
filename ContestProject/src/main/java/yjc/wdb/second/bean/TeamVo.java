package yjc.wdb.second.bean;

import java.security.Timestamp;
import java.sql.Date;

public class TeamVo {
	
	private String searchTypeFile;
	private String keyword;
	private int searchRights;
	private int Conlist;
	private String searchAreas;
	
	
	public String getSearchAreas() {
		return searchAreas;
	}
	public void setSearchAreas(String searchAreas) {
		this.searchAreas = searchAreas;
	}
	public String getSearchTypeFile() {
		return searchTypeFile;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	public void setSearchTypeFile(String searchTypeFile) {
		this.searchTypeFile = searchTypeFile;
	}	
	
	public int getSearchRights() {
		return searchRights;
	}
	public void setSearchRights(int searchRights) {
		this.searchRights = searchRights;
	}
	public int getConlist() {
		return Conlist;
	}
	public void setConlist(int conlist) {
		Conlist = conlist;
	}
	
	

	




	//team
	private int t_id;
	private String t_name;
	private String t_areas;
	private String t_content;
	private String t_filed;
	private String t_logo;
	private int t_permit;
	private Date t_regdate;

	//Member
	private int m_id;
	private int m_rights;
	private String u_id;
	private Date m_regdate;
	private Date m_withdrawdate;
	public int getT_id() {
		return t_id;
	}
	public void setT_id(int t_id) {
		this.t_id = t_id;
	}
	public String getT_name() {
		return t_name;
	}
	public void setT_name(String t_name) {
		this.t_name = t_name;
	}
	public String getT_areas() {
		return t_areas;
	}
	public void setT_areas(String t_areas) {
		this.t_areas = t_areas;
	}
	public String getT_content() {
		return t_content;
	}
	public void setT_content(String t_content) {
		this.t_content = t_content;
	}
	public String getT_filed() {
		return t_filed;
	}
	public void setT_filed(String t_filed) {
		this.t_filed = t_filed;
	}
	public String getT_logo() {
		return t_logo;
	}
	public void setT_logo(String t_logo) {
		this.t_logo = t_logo;
	}
	public int getT_permit() {
		return t_permit;
	}
	public void setT_permit(int t_permit) {
		this.t_permit = t_permit;
	}
	public Date getT_regdate() {
		return t_regdate;
	}
	public void setT_regdate(Date t_regdate) {
		this.t_regdate = t_regdate;
	}
	public int getM_id() {
		return m_id;
	}
	public void setM_id(int m_id) {
		this.m_id = m_id;
	}
	public int getM_rights() {
		return m_rights;
	}
	public void setM_rights(int m_rights) {
		this.m_rights = m_rights;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public Date getM_regdate() {
		return m_regdate;
	}
	public void setM_regdate(Date m_regdate) {
		this.m_regdate = m_regdate;
	}
	public Date getM_withdrawdate() {
		return m_withdrawdate;
	}
	public void setM_withdrawdate(Date m_withdrawdate) {
		this.m_withdrawdate = m_withdrawdate;
	}
	

	
	private String u_name;
	
	
	
	public String getU_name() {
		return u_name;
	}
	public void setU_name(String u_name) {
		this.u_name = u_name;
	}


}
