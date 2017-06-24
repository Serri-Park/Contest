package yjc.wdb.second.bean;

import java.sql.Date;

public class MessageVo extends TeamVo {

	/*
	 * CREATE TABLE `user` (
	`u_id` VARCHAR(50) NOT NULL,
	`u_pass` VARCHAR(50) NOT NULL,
	`u_name` VARCHAR(50) NOT NULL,
	`u_hp` VARCHAR(100) NOT NULL,
	`u_birthyear` VARCHAR(10) NOT NULL,
	`u_email` VARCHAR(100) NULL DEFAULT NULL,
	`u_major` VARCHAR(100) NOT NULL,
	`u_postcode` VARCHAR(100) NOT NULL,
	`u_address` VARCHAR(100) NOT NULL,
	`u_address2` VARCHAR(100) NOT NULL,
	`u_profile` VARCHAR(150) NULL DEFAULT NULL,
	`u_regdate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`g_id` INT(11) NULL DEFAULT NULL,
	PRIMARY KEY (`u_id`),
	INDEX `g_id` (`g_id`),
	CONSTRAINT `user_ibfk_1` FOREIGN KEY (`g_id`) REFERENCES `grade` (`g_id`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;

	 * */
	
	private String u_id;
	

	private String u_pass;
	private String u_name;
	private String U_hp;
	private Date u_birthyear;
	private String u_email;
	private String u_major;
	private String u_postcode;
	private String u_address;
	private String u_address2;
	private String u_profile;
	private int g_id = 1;
	
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
		return U_hp;
	}
	public void setU_hp(String u_hp) {
		U_hp = u_hp;
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

	
	/*
	 * 硫붿떆吏�
	 * CREATE TABLE `message` (
	`ms_id` INT(11) NOT NULL AUTO_INCREMENT,
	`ms_name` VARCHAR(50) NULL DEFAULT NULL,
	`ms_content` VARCHAR(150) NULL DEFAULT NULL,
	`ms_date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`send_id` VARCHAR(50) NOT NULL,
	PRIMARY KEY (`ms_id`),
	INDEX `send_data` (`send_id`),
	CONSTRAINT `message_ibfk_1` FOREIGN KEY (`send_id`) REFERENCES `user` (`u_id`)
)
	 * 
	 * */
	
	/*
	 * CREATE TABLE `receiver` (
	`rc_id` VARCHAR(50) NOT NULL,
	`ms_id` INT(11) NOT NULL,
	`rc_date` TIMESTAMP NULL DEFAULT NULL,
	INDEX `rc_id` (`rc_id`),
	INDEX `ms_id` (`ms_id`),
	CONSTRAINT `receiver_ibfk_1` FOREIGN KEY (`rc_id`) REFERENCES `user` (`u_id`),
	CONSTRAINT `receiver_ibfk_2` FOREIGN KEY (`ms_id`) REFERENCES `message` (`ms_id`)
	)
	 * 
	 * */
	private int ms_id;
	private String ms_name;
	private String ms_content;
	//spend
	private String send_id;
	//receive
	private String rc_id;
	private Date ms_date;
	private Date rc_date;
	
/*	//searchType
	private String searchType;
	private String keyword;
	*/
	public String getMs_name() {
		return ms_name;
	}
	public void setMs_name(String ms_name) {
		this.ms_name = ms_name;
	}
	public String getMs_content() {
		return ms_content;
	}
	public void setMs_content(String ms_content) {
		this.ms_content = ms_content;
	}
	public String getSend_id() {
		return send_id;
	}
	public void setSend_id(String send_id) {
		this.send_id = send_id;
	}
	public String getRc_id() {
		return rc_id;
	}
	public void setRc_id(String rc_id) {
		this.rc_id = rc_id;
	}
	public int getMs_id() {
		return ms_id;
	}
	public void setMs_id(int ms_id) {
		this.ms_id = ms_id;
	}
	public Date getMs_date() {
		return ms_date;
	}
	public void setMs_date(Date ms_date) {
		this.ms_date = ms_date;
	}
	public Date getRc_date() {
		return rc_date;
	}
	public void setRc_date(Date rc_date) {
		this.rc_date = rc_date;
	}
/*	
	//SearchType
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}*/
	 
}
