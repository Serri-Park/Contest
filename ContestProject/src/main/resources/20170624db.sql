
DROP TABLE `file`;
DROP TABLE ¡®bcomment¡¯
DROP TABLE ¡®board¡¯
DROP TABLE ¡®bgroup¡¯
DROP TABLE receiver
DROP TABLE message
DROP TABLE `bwmember` 
DROP TABLE `bwidea` 
DROP TABLE `bwpage` 
DROP TABLE `bwcategory` 
DROP TABLE `bw`
DROP TABLE `review` 
DROP TABLE `payment` 
DROP TABLE `preservation` 
DROP TABLE `place`
DROP TABLE `evaluation`  
DROP TABLE `elist` 
DROP TABLE `epage` 
DROP TABLE `work` 
DROP TABLE `receipt` 
DROP TABLE `contest` 
DROP TABLE`schedule` 
DROP TABLE member
DROP TABLE team
DROP TABLE user
DROP TABLE grade


CREATE TABLE grade(
g_id int(11) NOT NULL,
g_name VARCHAR(50) NOT NULL,
g_content VARCHAR(200) NOT NULL,
PRIMARY KEY (g_id)
);
CREATE TABLE user(
u_id VARCHAR(50) NOT NULL,
u_pass VARCHAR(50) NOT NULL,
u_name VARCHAR(50) NOT NULL,
u_hp VARCHAR(100) NOT NULL,
u_birthyear VARCHAR(10) NOT NULL,
u_email VARCHAR(100),
u_major VARCHAR(100) NOT NULL,
u_postcode VARCHAR(100) NOT NULL,
u_address VARCHAR(100) NOT NULL,
u_address2 VARCHAR(100) NOT NULL,
u_profile VARCHAR(150),
u_regdate TIMESTAMP default now(),
g_id int ,
PRIMARY KEY (u_id),
foreign key(g_id) references grade(g_id)
);
create table team(
t_id int not null auto_increment,
t_name varchar(100) not null,
t_areas varchar(100) not null,
t_filed varchar(50) NOT NULL,
t_regdate timestamp default now(),
t_content text,
t_logo varchar(150),
t_permit int not null,
primary key(t_id)
);

create table member(
m_id int auto_increment,
m_rights int,
m_regdate timestamp default now(),
m_withdawdate timestamp,
u_id varchar(50) not null,
t_id int not null,
primary key(m_id),
foreign key(u_id) references user(u_id),
foreign key(t_id) references team(t_id)
);
CREATE TABLE `schedule` (
`s_id` INT(11) NOT NULL AUTO_INCREMENT,
`s_title` VARCHAR(50) NOT NULL,
`s_content` TEXT NULL DEFAULT NULL,
¡®s_category¡¯ INT(11) NOT NULL,
`s_start` VARCHAR(50) NULL DEFAULT NULL,
`s_end` VARCHAR(50) NULL DEFAULT NULL,
`s_regdate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
`s_going` INT(5) NOT NULL,
`s_color` VARCHAR(50) NOT NULL DEFAULT '',
`u_id` VARCHAR(50),
t_id int,
PRIMARY KEY (`s_id`),
CONSTRAINT `u_id` FOREIGN KEY (u_id) REFERENCES `user`(u_id),
CONSTRAINT `t_id` FOREIGN KEY (t_id) REFERENCES `team`(t_id)
);


CREATE TABLE `contest` (
`c_id` INT(11) NOT NULL AUTO_INCREMENT,
`c_name` VARCHAR(100) NOT NULL DEFAULT '0',
`c_category` VARCHAR(500) NOT NULL,
`c_host` VARCHAR(150) NOT NULL,
`c_target` VARCHAR(150) NOT NULL,
`c_prize` VARCHAR(150) NULL DEFAULT NULL,
`c_homepage` VARCHAR(500) NULL DEFAULT NULL,
`c_content` TEXT NOT NULL,
`c_viewcnt` INT(11) NULL DEFAULT '0',
`c_startdate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
`c_enddate` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
`c_regdate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
`c_poster` VARCHAR(200) NULL DEFAULT NULL,
`t_id` INT(11) NULL DEFAULT NULL,
PRIMARY KEY (`c_id`),
INDEX `teamid` (`t_id`),
CONSTRAINT `teamid` FOREIGN KEY (`t_id`) REFERENCES `team` (`t_id`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;


CREATE TABLE `receipt` (
`r_id` INT(11) NOT NULL AUTO_INCREMENT,
`r_regdate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
`t_id` INT(11) NULL DEFAULT NULL,
`c_id` INT(11) NULL DEFAULT NULL,
PRIMARY KEY (`r_id`),
INDEX `teamid` (`t_id`),
INDEX `contestid` (`c_id`),
CONSTRAINT `contestid` FOREIGN KEY (`c_id`) REFERENCES `contest` (`c_id`),
CONSTRAINT `team_id` FOREIGN KEY (`t_id`) REFERENCES `team` (`t_id`)
);
CREATE TABLE `work` (
`w_id` INT(11) NOT NULL AUTO_INCREMENT,
`w_name` VARCHAR(100) NOT NULL,
`w_result` VARCHAR(100) NOT NULL DEFAULT '0',
`w_content` TEXT NULL,
`r_id` INT(11) NULL DEFAULT '0',
PRIMARY KEY (`w_id`),
INDEX `r_id` (`r_id`),
CONSTRAINT `r_id` FOREIGN KEY (`r_id`) REFERENCES `receipt` (`r_id`)
);
CREATE TABLE `epage` (
	`ep_id` INT(11) NOT NULL AUTO_INCREMENT,
	`ep_stage` INT(11) NULL DEFAULT NULL,
	`ep_how` VARCHAR(50) NULL DEFAULT NULL,
	`ep_state` INT(11) NOT NULL DEFAULT '0',
	`c_id` INT(11) NULL DEFAULT NULL,
	PRIMARY KEY (`ep_id`),
	INDEX `FK_c_id` (`c_id`),
	CONSTRAINT `FK_c_id` FOREIGN KEY (`c_id`) REFERENCES `contest` (`c_id`) ON UPDATE CASCADE ON DELETE CASCADE
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
AUTO_INCREMENT=133
;
CREATE TABLE `elist` (
	`el_id` INT(11) NOT NULL AUTO_INCREMENT,
	`el_name` VARCHAR(50) NOT NULL,
	`el_score` INT(11) NULL DEFAULT NULL,
	`ep_id` INT(11) NULL DEFAULT NULL,
	PRIMARY KEY (`el_id`),
	INDEX `FK_ep_id` (`ep_id`),
	CONSTRAINT `FK_ep_id` FOREIGN KEY (`ep_id`) REFERENCES `epage` (`ep_id`) ON UPDATE CASCADE ON DELETE CASCADE
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
AUTO_INCREMENT=75
;
CREATE TABLE `evaluation` (
	`e_id` INT(11) NOT NULL AUTO_INCREMENT,
	`e_score` INT(11) NOT NULL DEFAULT '0',
	`w_id` INT(11) NOT NULL,
	`u_id` VARCHAR(50) NOT NULL,
	`el_id` INT(11) NULL DEFAULT NULL,
	PRIMARY KEY (`e_id`),
	INDEX `FK_eval_work_id` (`w_id`),
	INDEX `FK_el_id` (`el_id`),
	INDEX `FK_eval_u_id` (`u_id`),
	CONSTRAINT `FK_el_id` FOREIGN KEY (`el_id`) REFERENCES `elist` (`el_id`) ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT `FK_eval_u_id` FOREIGN KEY (`u_id`) REFERENCES `user` (`u_id`),
	CONSTRAINT `FK_eval_work_id` FOREIGN KEY (`w_id`) REFERENCES `work` (`w_id`) ON UPDATE CASCADE ON DELETE CASCADE
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
AUTO_INCREMENT=53
;

CREATE TABLE `place` (
`p_id` INT(11) NOT NULL AUTO_INCREMENT,
`p_name` VARCHAR(100) NOT NULL,
`p_content` TEXT NULL DEFAULT NULL,
`p_Kind` VARCHAR(100) NULL DEFAULT NULL,
`p_address` VARCHAR(200) NULL DEFAULT NULL,
`p_cost` INT(11) NULL DEFAULT NULL,
`p_picture` VARCHAR(200) NULL DEFAULT NULL,
`p_lat` FLOAT(10,6) NULL DEFAULT NULL,
`p_lng` FLOAT(10,6) NULL DEFAULT NULL,
`p_option` VARCHAR(200) NULL DEFAULT NULL,
`p_regdate`  TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
`u_id` VARCHAR(100) NOT NULL,
PRIMARY KEY (`p_id`),
INDEX `u_id` (`u_id`),
CONSTRAINT `place_ibfk_1` FOREIGN KEY (`u_id`) REFERENCES `user` (`u_id`) ON DELETE CASCADE
);
CREATE TABLE `preservation` (
`pr_id` INT(11) NOT NULL AUTO_INCREMENT,
`pr_resdate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
`pr_starttime` VARCHAR(200) NULL DEFAULT NULL,
`pr_endtime` VARCHAR(200) NULL DEFAULT NULL,
`pr_status` INT(11) NULL DEFAULT '0',
`u_id` VARCHAR(100) NOT NULL,
`p_id` INT(11) NOT NULL,
PRIMARY KEY (`pr_id`),
INDEX `u_id` (`u_id`),
INDEX `p_id` (`p_id`),
CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`u_id`) REFERENCES `user` (`u_id`) ON DELETE CASCADE,
CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`p_id`) REFERENCES `place` (`p_id`) ON DELETE CASCADE
);
CREATE TABLE `payment` (
`pr_id` INT(11) NOT NULL,
`payKind` INT(11) NOT NULL,
`payStatus` INT(11) NULL DEFAULT '0',
`pay_date` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
INDEX `pr_id` (`pr_id`),
CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`pr_id`) REFERENCES `preservation` (`pr_id`) ON DELETE CASCADE
);
CREATE TABLE `review` (
`u_id` VARCHAR(100) NOT NULL,
`p_id` INT(11) NOT NULL,
`rv_point` INT(11) NULL DEFAULT NULL,
`rv_replycontent` TEXT NULL DEFAULT NULL,
`rv_reg_date` DATE NULL DEFAULT NULL,
INDEX `u_id` (`u_id`),
INDEX `p_id` (`p_id`),
CONSTRAINT `review_ibfk_1` FOREIGN KEY (`u_id`) REFERENCES `user` (`u_id`) ON DELETE CASCADE,
CONSTRAINT `review_ibfk_2` FOREIGN KEY (`p_id`) REFERENCES `place` (`p_id`) ON DELETE CASCADE
);
CREATE TABLE `bw` (
`bw_id` INT(11) NOT NULL AUTO_INCREMENT,
`bw_sub` VARCHAR(50) NULL DEFAULT NULL,
`bw_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
`bw_timer` VARCHAR(50) NOT NULL,
`bw_pagenum` INT(11) NOT NULL,
`t_id` INT(11) NULL DEFAULT NULL,
PRIMARY KEY (`bw_id`),
INDEX `1t_id` (`t_id`),
CONSTRAINT `1t_id` FOREIGN KEY (`t_id`) REFERENCES `team` (`t_id`) ON UPDATE CASCADE ON DELETE CASCADE
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;


CREATE TABLE IF NOT EXISTS `bwcategory` (
`bwc_id` int(11) NOT NULL,
`bwc_content` varchar(50) DEFAULT NULL,
PRIMARY KEY (`bwc_id`)
);
CREATE TABLE IF NOT EXISTS `bwpage` (
`bwp_id` int(11) NOT NULL AUTO_INCREMENT,
`bw_id` int(11) NOT NULL,
PRIMARY KEY (`bwp_id`),
INDEX `bw_id` (`bw_id`),
CONSTRAINT `bw_id` FOREIGN KEY (`bw_id`) REFERENCES `bw` (`bw_id`) ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS `bwidea` (
`bwi_id` int(11) NOT NULL AUTO_INCREMENT,
`bwi_content` varchar(50) DEFAULT NULL,
`bwi_replyid` int(11) DEFAULT NULL,
`bwp_id` int(11) NOT NULL,
`bwc_id` int(11) DEFAULT NULL,
`u_id` int(11) DEFAULT NULL,
PRIMARY KEY (`bwi_id`),
KEY `bwc_id` (`bwc_id`),
KEY `bwp_id` (`bwp_id`),
CONSTRAINT `bwc_id` FOREIGN KEY (`bwc_id`) REFERENCES `bwcategory` (`bwc_id`) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT `bwp_id` FOREIGN KEY (`bwp_id`) REFERENCES `bwpage` (`bwp_id`) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE IF NOT EXISTS `bwmember` (
`u_id` varchar(50) NOT NULL,
`bw_id` int(11) NOT NULL,
FOREIGN KEY (`bw_id`) REFERENCES `bw` (`bw_id`) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (`u_id`) REFERENCES `user` (`u_id`) ON DELETE CASCADE ON UPDATE CASCADE
);

create table message(
ms_id int not null auto_increment,
ms_name varchar(50),
ms_content text,
ms_date timestamp default now(),
send_id varchar(50) not null,
primary key(ms_id),
foreign key(send_id) references user(u_id)
);
create table receiver(
rc_id varchar(50) not null,
ms_id int not null,
rc_date date,
foreign key(rc_id) references user(u_id),
foreign key(ms_id) references message(ms_id)
);

CREATE TABLE `bgroup` (
   `bg_id` INT(11) NOT NULL,
   `bg_name` VARCHAR(50) NOT NULL,
   PRIMARY KEY (`bg_id`)
);
CREATE TABLE `board` (
   `b_id` INT(11) NOT NULL AUTO_INCREMENT,
   `b_title` VARCHAR(200) NOT NULL,
   `b_content` TEXT NULL,
   `b_regdate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
   `b_hits` INT(11) NOT NULL DEFAULT '0',
   `u_id` VARCHAR(50),
   `bg_id` INT(11),
   foreign key(`u_id`) REFERENCES user(u_id),
   foreign key(`bg_id`) REFERENCES bgroup(bg_id),
   PRIMARY KEY (`b_id`)
);
CREATE TABLE `bcomment` (
`bc_id` INT(11) NOT NULL AUTO_INCREMENT,
`bc_content` VARCHAR(1000) NOT NULL,
`bc_regdate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
`b_id` INT(11), 
`u_id` VARCHAR(50), 
foreign key(`b_id`) REFERENCES board(b_id),
foreign key(`u_id`) REFERENCES user(u_id),
PRIMARY KEY (`bc_id`)
);
CREATE TABLE `file` (
	`f_name` VARCHAR(200) NOT NULL,
	`f_regdate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`b_id` INT(11) NULL DEFAULT NULL,
	`w_id` INT(11) NULL DEFAULT NULL,
	`c_id` INT(11) NULL DEFAULT NULL,
	`p_id` INT(11) NULL DEFAULT NULL,
	`t_id` INT(11) NULL DEFAULT NULL,
foreign key(`b_id`) REFERENCES board(b_id),
foreign key(`w_id`) REFERENCES work(w_id),
foreign key(`c_id`) REFERENCES contest(c_id),
foreign key(`p_id`) REFERENCES place(p_id),
foreign key(`t_id`) REFERENCES team(t_id)
);


