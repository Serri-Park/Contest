-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        10.1.19-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- contest 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `contest` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `contest`;


-- 테이블 contest.bcomment 구조 내보내기
CREATE TABLE IF NOT EXISTS `bcomment` (
  `bc_id` int(11) NOT NULL AUTO_INCREMENT,
  `bc_content` varchar(1000) NOT NULL,
  `bc_regdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `b_id` int(11) DEFAULT NULL,
  `u_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`bc_id`),
  KEY `b_id` (`b_id`),
  KEY `u_id` (`u_id`),
  CONSTRAINT `bcomment_ibfk_1` FOREIGN KEY (`b_id`) REFERENCES `board` (`b_id`),
  CONSTRAINT `bcomment_ibfk_2` FOREIGN KEY (`u_id`) REFERENCES `user` (`u_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 contest.bcomment:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `bcomment` DISABLE KEYS */;
/*!40000 ALTER TABLE `bcomment` ENABLE KEYS */;


-- 테이블 contest.bgroup 구조 내보내기
CREATE TABLE IF NOT EXISTS `bgroup` (
  `bg_id` int(11) NOT NULL,
  `bg_name` varchar(50) NOT NULL,
  PRIMARY KEY (`bg_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 contest.bgroup:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `bgroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `bgroup` ENABLE KEYS */;


-- 테이블 contest.board 구조 내보내기
CREATE TABLE IF NOT EXISTS `board` (
  `b_id` int(11) NOT NULL AUTO_INCREMENT,
  `b_title` varchar(200) NOT NULL,
  `b_content` text,
  `b_regdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `b_hits` int(11) NOT NULL DEFAULT '0',
  `u_id` varchar(50) DEFAULT NULL,
  `bg_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`b_id`),
  KEY `u_id` (`u_id`),
  KEY `bg_id` (`bg_id`),
  CONSTRAINT `board_ibfk_1` FOREIGN KEY (`u_id`) REFERENCES `user` (`u_id`),
  CONSTRAINT `board_ibfk_2` FOREIGN KEY (`bg_id`) REFERENCES `bgroup` (`bg_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 contest.board:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
/*!40000 ALTER TABLE `board` ENABLE KEYS */;


-- 테이블 contest.bw 구조 내보내기
CREATE TABLE IF NOT EXISTS `bw` (
  `bw_id` int(11) NOT NULL AUTO_INCREMENT,
  `bw_sub` varchar(50) DEFAULT NULL,
  `bw_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `bw_timer` varchar(50) NOT NULL,
  `bw_pagenum` int(11) NOT NULL,
  `t_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`bw_id`),
  KEY `1t_id` (`t_id`),
  CONSTRAINT `1t_id` FOREIGN KEY (`t_id`) REFERENCES `team` (`t_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 contest.bw:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `bw` DISABLE KEYS */;
/*!40000 ALTER TABLE `bw` ENABLE KEYS */;


-- 테이블 contest.bwcategory 구조 내보내기
CREATE TABLE IF NOT EXISTS `bwcategory` (
  `bwc_id` int(11) NOT NULL,
  `bwc_content` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`bwc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 contest.bwcategory:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `bwcategory` DISABLE KEYS */;
/*!40000 ALTER TABLE `bwcategory` ENABLE KEYS */;


-- 테이블 contest.bwidea 구조 내보내기
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 contest.bwidea:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `bwidea` DISABLE KEYS */;
/*!40000 ALTER TABLE `bwidea` ENABLE KEYS */;


-- 테이블 contest.bwmember 구조 내보내기
CREATE TABLE IF NOT EXISTS `bwmember` (
  `u_id` varchar(50) NOT NULL,
  `bw_id` int(11) NOT NULL,
  KEY `bw_id` (`bw_id`),
  KEY `u_id` (`u_id`),
  CONSTRAINT `bwmember_ibfk_1` FOREIGN KEY (`bw_id`) REFERENCES `bw` (`bw_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `bwmember_ibfk_2` FOREIGN KEY (`u_id`) REFERENCES `user` (`u_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 contest.bwmember:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `bwmember` DISABLE KEYS */;
/*!40000 ALTER TABLE `bwmember` ENABLE KEYS */;


-- 테이블 contest.bwpage 구조 내보내기
CREATE TABLE IF NOT EXISTS `bwpage` (
  `bwp_id` int(11) NOT NULL AUTO_INCREMENT,
  `bw_id` int(11) NOT NULL,
  PRIMARY KEY (`bwp_id`),
  KEY `bw_id` (`bw_id`),
  CONSTRAINT `bw_id` FOREIGN KEY (`bw_id`) REFERENCES `bw` (`bw_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 contest.bwpage:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `bwpage` DISABLE KEYS */;
/*!40000 ALTER TABLE `bwpage` ENABLE KEYS */;


-- 테이블 contest.contest 구조 내보내기
CREATE TABLE IF NOT EXISTS `contest` (
  `c_id` int(11) NOT NULL AUTO_INCREMENT,
  `c_name` varchar(100) NOT NULL DEFAULT '0',
  `c_category` varchar(500) NOT NULL,
  `c_host` varchar(150) NOT NULL,
  `c_target` varchar(150) NOT NULL,
  `c_prize` varchar(150) DEFAULT NULL,
  `c_homepage` varchar(500) DEFAULT NULL,
  `c_content` text NOT NULL,
  `c_viewcnt` int(11) DEFAULT '0',
  `c_startdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `c_enddate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `c_regdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `c_poster` varchar(200) DEFAULT NULL,
  `t_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`c_id`),
  KEY `teamid` (`t_id`),
  CONSTRAINT `teamid` FOREIGN KEY (`t_id`) REFERENCES `team` (`t_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- 테이블 데이터 contest.contest:~2 rows (대략적) 내보내기
/*!40000 ALTER TABLE `contest` DISABLE KEYS */;
INSERT INTO `contest` (`c_id`, `c_name`, `c_category`, `c_host`, `c_target`, `c_prize`, `c_homepage`, `c_content`, `c_viewcnt`, `c_startdate`, `c_enddate`, `c_regdate`, `c_poster`, `t_id`) VALUES
	(1, '고고 디자인', '논문/리포트, 체험/참여', 'ㅇㅇ', 'ㅇㅇ', '1천만원이하', '', '<p>11</p>', 17, '2017-06-23 23:53:50', '2017-06-30 01:01:00', '2017-06-23 23:45:38', '/2017/06/23/thumbNail_f9648b59-e06e-4528-b5e9-66a242cb147b_1495985512.gif', 5),
	(3, '우체국디자인', '디자인/캐릭터/만화', '우체국', '제한없음', '1천만원이하', '', '<p>우체국</p>', 0, '2017-06-15 01:00:00', '2017-06-30 01:01:00', '2017-06-24 11:38:34', '/2017/06/24/thumbNail_04d38fe4-9a90-46c8-9716-35c3beaef1a6_disign.JPG', 9);
/*!40000 ALTER TABLE `contest` ENABLE KEYS */;


-- 테이블 contest.elist 구조 내보내기
CREATE TABLE IF NOT EXISTS `elist` (
  `el_id` int(11) NOT NULL AUTO_INCREMENT,
  `el_name` varchar(50) NOT NULL,
  `el_score` int(11) DEFAULT NULL,
  `ep_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`el_id`),
  KEY `FK_ep_id` (`ep_id`),
  CONSTRAINT `FK_ep_id` FOREIGN KEY (`ep_id`) REFERENCES `epage` (`ep_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8;

-- 테이블 데이터 contest.elist:~8 rows (대략적) 내보내기
/*!40000 ALTER TABLE `elist` DISABLE KEYS */;
INSERT INTO `elist` (`el_id`, `el_name`, `el_score`, `ep_id`) VALUES
	(75, 'Pass or Fail 방법', NULL, 133),
	(76, '팀워크', 30, 134),
	(77, '창의성', 40, 134),
	(78, '독창성', 30, 134),
	(83, 'Pass or Fail 방법', NULL, 137),
	(84, '독창성', 20, 138),
	(85, '예술성', 50, 138),
	(86, '창의성', 30, 138);
/*!40000 ALTER TABLE `elist` ENABLE KEYS */;


-- 테이블 contest.epage 구조 내보내기
CREATE TABLE IF NOT EXISTS `epage` (
  `ep_id` int(11) NOT NULL AUTO_INCREMENT,
  `ep_stage` int(11) DEFAULT NULL,
  `ep_how` varchar(50) DEFAULT NULL,
  `ep_state` int(11) NOT NULL DEFAULT '0',
  `c_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`ep_id`),
  KEY `FK_c_id` (`c_id`),
  CONSTRAINT `FK_c_id` FOREIGN KEY (`c_id`) REFERENCES `contest` (`c_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=139 DEFAULT CHARSET=utf8;

-- 테이블 데이터 contest.epage:~4 rows (대략적) 내보내기
/*!40000 ALTER TABLE `epage` DISABLE KEYS */;
INSERT INTO `epage` (`ep_id`, `ep_stage`, `ep_how`, `ep_state`, `c_id`) VALUES
	(133, 1, 'Pass or Fail 방법', 2, 1),
	(134, 2, '상세채점 방법', 1, 1),
	(137, 1, 'Pass or Fail 방법', 1, 3),
	(138, 2, '상세채점 방법', 0, 3);
/*!40000 ALTER TABLE `epage` ENABLE KEYS */;


-- 테이블 contest.evaluation 구조 내보내기
CREATE TABLE IF NOT EXISTS `evaluation` (
  `e_id` int(11) NOT NULL AUTO_INCREMENT,
  `e_score` int(11) NOT NULL DEFAULT '0',
  `w_id` int(11) NOT NULL,
  `u_id` varchar(50) NOT NULL,
  `el_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`e_id`),
  KEY `FK_eval_work_id` (`w_id`),
  KEY `FK_el_id` (`el_id`),
  KEY `FK_eval_u_id` (`u_id`),
  CONSTRAINT `FK_el_id` FOREIGN KEY (`el_id`) REFERENCES `elist` (`el_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_eval_u_id` FOREIGN KEY (`u_id`) REFERENCES `user` (`u_id`),
  CONSTRAINT `FK_eval_work_id` FOREIGN KEY (`w_id`) REFERENCES `work` (`w_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;

-- 테이블 데이터 contest.evaluation:~3 rows (대략적) 내보내기
/*!40000 ALTER TABLE `evaluation` DISABLE KEYS */;
INSERT INTO `evaluation` (`e_id`, `e_score`, `w_id`, `u_id`, `el_id`) VALUES
	(61, 100, 3, 'eval02', 83),
	(62, 100, 2, 'eval02', 83),
	(63, 1, 1, 'eval02', 83);
/*!40000 ALTER TABLE `evaluation` ENABLE KEYS */;


-- 테이블 contest.file 구조 내보내기
CREATE TABLE IF NOT EXISTS `file` (
  `f_name` varchar(200) NOT NULL,
  `f_regdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `b_id` int(11) DEFAULT NULL,
  `w_id` int(11) DEFAULT NULL,
  `c_id` int(11) DEFAULT NULL,
  `p_id` int(11) DEFAULT NULL,
  `t_id` int(11) DEFAULT NULL,
  KEY `b_id` (`b_id`),
  KEY `w_id` (`w_id`),
  KEY `c_id` (`c_id`),
  KEY `p_id` (`p_id`),
  KEY `t_id` (`t_id`),
  CONSTRAINT `file_ibfk_1` FOREIGN KEY (`b_id`) REFERENCES `board` (`b_id`),
  CONSTRAINT `file_ibfk_2` FOREIGN KEY (`w_id`) REFERENCES `work` (`w_id`),
  CONSTRAINT `file_ibfk_3` FOREIGN KEY (`c_id`) REFERENCES `contest` (`c_id`),
  CONSTRAINT `file_ibfk_4` FOREIGN KEY (`p_id`) REFERENCES `place` (`p_id`),
  CONSTRAINT `file_ibfk_5` FOREIGN KEY (`t_id`) REFERENCES `team` (`t_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 contest.file:~3 rows (대략적) 내보내기
/*!40000 ALTER TABLE `file` DISABLE KEYS */;
INSERT INTO `file` (`f_name`, `f_regdate`, `b_id`, `w_id`, `c_id`, `p_id`, `t_id`) VALUES
	('/연하1.jpg', '2017-06-23 23:55:59', NULL, 1, NULL, NULL, NULL),
	('/연하2.png', '2017-06-23 23:55:59', NULL, 2, NULL, NULL, NULL),
	('/연하3.jpg', '2017-06-23 23:55:59', NULL, 3, NULL, NULL, NULL);
/*!40000 ALTER TABLE `file` ENABLE KEYS */;


-- 테이블 contest.grade 구조 내보내기
CREATE TABLE IF NOT EXISTS `grade` (
  `g_id` int(11) NOT NULL,
  `g_name` varchar(50) NOT NULL,
  `g_content` varchar(200) NOT NULL,
  PRIMARY KEY (`g_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 contest.grade:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `grade` DISABLE KEYS */;
/*!40000 ALTER TABLE `grade` ENABLE KEYS */;


-- 테이블 contest.member 구조 내보내기
CREATE TABLE IF NOT EXISTS `member` (
  `m_id` int(11) NOT NULL AUTO_INCREMENT,
  `m_rights` int(11) DEFAULT NULL,
  `m_regdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `m_withdawdate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `u_id` varchar(50) NOT NULL,
  `t_id` int(11) NOT NULL,
  PRIMARY KEY (`m_id`),
  KEY `u_id` (`u_id`),
  KEY `t_id` (`t_id`),
  CONSTRAINT `member_ibfk_1` FOREIGN KEY (`u_id`) REFERENCES `user` (`u_id`),
  CONSTRAINT `member_ibfk_2` FOREIGN KEY (`t_id`) REFERENCES `team` (`t_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- 테이블 데이터 contest.member:~7 rows (대략적) 내보내기
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` (`m_id`, `m_rights`, `m_regdate`, `m_withdawdate`, `u_id`, `t_id`) VALUES
	(4, 3, '2017-06-24 11:30:49', '0000-00-00 00:00:00', 'eval01', 9),
	(5, 4, '2017-06-24 11:55:13', '0000-00-00 00:00:00', 'eval02', 9),
	(6, 10, '2017-06-24 11:55:13', '0000-00-00 00:00:00', 'eval03', 9),
	(7, 10, '2017-06-24 11:55:13', '0000-00-00 00:00:00', 'eval04', 9),
	(8, 10, '2017-06-24 11:55:13', '0000-00-00 00:00:00', 'eval05', 9),
	(9, 10, '2017-06-24 11:55:13', '0000-00-00 00:00:00', 'eval06', 9),
	(10, 1, '2017-06-24 12:03:16', '0000-00-00 00:00:00', 'join01', 10);
/*!40000 ALTER TABLE `member` ENABLE KEYS */;


-- 테이블 contest.message 구조 내보내기
CREATE TABLE IF NOT EXISTS `message` (
  `ms_id` int(11) NOT NULL AUTO_INCREMENT,
  `ms_name` varchar(50) DEFAULT NULL,
  `ms_content` text,
  `ms_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `send_id` varchar(50) NOT NULL,
  PRIMARY KEY (`ms_id`),
  KEY `send_id` (`send_id`),
  CONSTRAINT `message_ibfk_1` FOREIGN KEY (`send_id`) REFERENCES `user` (`u_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 contest.message:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
/*!40000 ALTER TABLE `message` ENABLE KEYS */;


-- 테이블 contest.payment 구조 내보내기
CREATE TABLE IF NOT EXISTS `payment` (
  `pr_id` int(11) NOT NULL,
  `payKind` int(11) NOT NULL,
  `payStatus` int(11) DEFAULT '0',
  `pay_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  KEY `pr_id` (`pr_id`),
  CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`pr_id`) REFERENCES `preservation` (`pr_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 contest.payment:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;


-- 테이블 contest.place 구조 내보내기
CREATE TABLE IF NOT EXISTS `place` (
  `p_id` int(11) NOT NULL AUTO_INCREMENT,
  `p_name` varchar(100) NOT NULL,
  `p_content` text,
  `p_Kind` varchar(100) DEFAULT NULL,
  `p_address` varchar(200) DEFAULT NULL,
  `p_cost` int(11) DEFAULT NULL,
  `p_picture` varchar(200) DEFAULT NULL,
  `p_lat` float(10,6) DEFAULT NULL,
  `p_lng` float(10,6) DEFAULT NULL,
  `p_option` varchar(200) DEFAULT NULL,
  `p_regdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `u_id` varchar(100) NOT NULL,
  PRIMARY KEY (`p_id`),
  KEY `u_id` (`u_id`),
  CONSTRAINT `place_ibfk_1` FOREIGN KEY (`u_id`) REFERENCES `user` (`u_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 contest.place:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `place` DISABLE KEYS */;
/*!40000 ALTER TABLE `place` ENABLE KEYS */;


-- 테이블 contest.preservation 구조 내보내기
CREATE TABLE IF NOT EXISTS `preservation` (
  `pr_id` int(11) NOT NULL AUTO_INCREMENT,
  `pr_resdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `pr_starttime` varchar(200) DEFAULT NULL,
  `pr_endtime` varchar(200) DEFAULT NULL,
  `pr_status` int(11) DEFAULT '0',
  `u_id` varchar(100) NOT NULL,
  `p_id` int(11) NOT NULL,
  PRIMARY KEY (`pr_id`),
  KEY `u_id` (`u_id`),
  KEY `p_id` (`p_id`),
  CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`u_id`) REFERENCES `user` (`u_id`) ON DELETE CASCADE,
  CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`p_id`) REFERENCES `place` (`p_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 contest.preservation:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `preservation` DISABLE KEYS */;
/*!40000 ALTER TABLE `preservation` ENABLE KEYS */;


-- 테이블 contest.receipt 구조 내보내기
CREATE TABLE IF NOT EXISTS `receipt` (
  `r_id` int(11) NOT NULL AUTO_INCREMENT,
  `r_regdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `t_id` int(11) DEFAULT NULL,
  `c_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`r_id`),
  KEY `teamid` (`t_id`),
  KEY `contestid` (`c_id`),
  CONSTRAINT `contestid` FOREIGN KEY (`c_id`) REFERENCES `contest` (`c_id`),
  CONSTRAINT `team_id` FOREIGN KEY (`t_id`) REFERENCES `team` (`t_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- 테이블 데이터 contest.receipt:~3 rows (대략적) 내보내기
/*!40000 ALTER TABLE `receipt` DISABLE KEYS */;
INSERT INTO `receipt` (`r_id`, `r_regdate`, `t_id`, `c_id`) VALUES
	(1, '2017-06-23 23:49:06', 5, 3),
	(2, '2017-06-23 23:52:12', 7, 3),
	(3, '2017-06-23 23:52:44', 8, 3);
/*!40000 ALTER TABLE `receipt` ENABLE KEYS */;


-- 테이블 contest.receiver 구조 내보내기
CREATE TABLE IF NOT EXISTS `receiver` (
  `rc_id` varchar(50) NOT NULL,
  `ms_id` int(11) NOT NULL,
  `rc_date` date DEFAULT NULL,
  KEY `rc_id` (`rc_id`),
  KEY `ms_id` (`ms_id`),
  CONSTRAINT `receiver_ibfk_1` FOREIGN KEY (`rc_id`) REFERENCES `user` (`u_id`),
  CONSTRAINT `receiver_ibfk_2` FOREIGN KEY (`ms_id`) REFERENCES `message` (`ms_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 contest.receiver:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `receiver` DISABLE KEYS */;
/*!40000 ALTER TABLE `receiver` ENABLE KEYS */;


-- 테이블 contest.review 구조 내보내기
CREATE TABLE IF NOT EXISTS `review` (
  `u_id` varchar(100) NOT NULL,
  `p_id` int(11) NOT NULL,
  `rv_point` int(11) DEFAULT NULL,
  `rv_replycontent` text,
  `rv_reg_date` date DEFAULT NULL,
  KEY `u_id` (`u_id`),
  KEY `p_id` (`p_id`),
  CONSTRAINT `review_ibfk_1` FOREIGN KEY (`u_id`) REFERENCES `user` (`u_id`) ON DELETE CASCADE,
  CONSTRAINT `review_ibfk_2` FOREIGN KEY (`p_id`) REFERENCES `place` (`p_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 contest.review:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
/*!40000 ALTER TABLE `review` ENABLE KEYS */;


-- 테이블 contest.schedule 구조 내보내기
CREATE TABLE IF NOT EXISTS `schedule` (
  `s_id` int(11) NOT NULL AUTO_INCREMENT,
  `s_title` varchar(50) NOT NULL,
  `s_content` text,
  `‘s_category’` int(11) NOT NULL,
  `s_start` varchar(50) DEFAULT NULL,
  `s_end` varchar(50) DEFAULT NULL,
  `s_regdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `s_going` int(5) NOT NULL,
  `s_color` varchar(50) NOT NULL DEFAULT '',
  `u_id` varchar(50) DEFAULT NULL,
  `t_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`s_id`),
  KEY `u_id` (`u_id`),
  KEY `t_id` (`t_id`),
  CONSTRAINT `t_id` FOREIGN KEY (`t_id`) REFERENCES `team` (`t_id`),
  CONSTRAINT `u_id` FOREIGN KEY (`u_id`) REFERENCES `user` (`u_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 contest.schedule:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `schedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `schedule` ENABLE KEYS */;


-- 테이블 contest.team 구조 내보내기
CREATE TABLE IF NOT EXISTS `team` (
  `t_id` int(11) NOT NULL AUTO_INCREMENT,
  `t_name` varchar(100) NOT NULL,
  `t_areas` varchar(100) NOT NULL,
  `t_filed` varchar(50) NOT NULL,
  `t_regdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `t_content` text,
  `t_logo` varchar(150) DEFAULT NULL,
  `t_permit` int(11) NOT NULL,
  PRIMARY KEY (`t_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- 테이블 데이터 contest.team:~7 rows (대략적) 내보내기
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
INSERT INTO `team` (`t_id`, `t_name`, `t_areas`, `t_filed`, `t_regdate`, `t_content`, `t_logo`, `t_permit`) VALUES
	(5, '개최디자인팀', '대구', '논문/리포트', '2017-06-23 23:44:59', '팀디자인개최', '/KakaoTalk_20170529_1902191042017-44-23 11_44_59.png', 2),
	(6, '영상디자인 팀', '대구', '논문/리포트', '2017-06-23 23:46:58', '팀데이터여기', '/3332017-46-23 11_46_58.jpg', 2),
	(7, '올키', '대구', '논문/리포트', '2017-06-23 23:50:16', '올키로', '/2222017-50-23 11_50_16.jpg', 2),
	(8, '올키12', '대구', '논문/리포트', '2017-06-23 23:50:16', '올키로', '/2222017-50-23 11_50_16.jpg', 2),
	(9, '심사디자인', '대구', '논문/리포트', '2017-06-24 11:30:49', '디자인', '/disign2017-30-24 11_30_47.JPG', 1),
	(10, '참가팀01', '대구', '디자인/캐릭터/만화', '2017-06-24 12:03:16', '디자인공모전참가', '/3332017-03-24 12_03_16.jpg', 2),
	(11, '참가팀02', '서울', '디자인/캐릭터/만화', '2017-06-24 12:03:16', '디자인공모전참가', '/3332017-03-24 12_03_16.jpg', 1);
/*!40000 ALTER TABLE `team` ENABLE KEYS */;


-- 테이블 contest.user 구조 내보내기
CREATE TABLE IF NOT EXISTS `user` (
  `u_id` varchar(50) NOT NULL,
  `u_pass` varchar(50) NOT NULL,
  `u_name` varchar(50) NOT NULL,
  `u_hp` varchar(100) NOT NULL,
  `u_birthyear` varchar(10) NOT NULL,
  `u_email` varchar(100) DEFAULT NULL,
  `u_major` varchar(100) NOT NULL,
  `u_postcode` varchar(100) NOT NULL,
  `u_address` varchar(100) NOT NULL,
  `u_address2` varchar(100) NOT NULL,
  `u_profile` varchar(150) DEFAULT NULL,
  `u_regdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `g_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`u_id`),
  KEY `g_id` (`g_id`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`g_id`) REFERENCES `grade` (`g_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 contest.user:~10 rows (대략적) 내보내기
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`u_id`, `u_pass`, `u_name`, `u_hp`, `u_birthyear`, `u_email`, `u_major`, `u_postcode`, `u_address`, `u_address2`, `u_profile`, `u_regdate`, `g_id`) VALUES
	('eval01', '123123', '김심사', '01030333232', '1995-12-12', 'gfgf@naver.com', '디자인/캐릭터/만화', 'sds', 'ds', 'ds', '1498271237177.jpg', '2017-06-24 11:27:17', NULL),
	('eval02', '123123', '김심사5', '01030333232', '1995-12-12', 'gfgf@naver.com', '디자인/캐릭터/만화', 'sds', 'ds', 'ds', '1498271237177.jpg', '2017-06-24 11:27:17', NULL),
	('eval03', '123123', '김심사1', '01030333232', '1995-12-12', 'gfgf@naver.com', '디자인/캐릭터/만화', 'sds', 'ds', 'ds', '1498271237177.jpg', '2017-06-24 11:27:17', NULL),
	('eval04', '123123', '김심사2', '01030333232', '1995-12-12', 'gfgf@naver.com', '디자인/캐릭터/만화', 'sds', 'ds', 'ds', '1498271237177.jpg', '2017-06-24 11:27:17', NULL),
	('eval05', '123123', '김심사3', '01030333232', '1995-12-12', 'gfgf@naver.com', '디자인/캐릭터/만화', 'sds', 'ds', 'ds', '1498271237177.jpg', '2017-06-24 11:27:17', NULL),
	('eval06', '123123', '김심사4', '01030333232', '1995-12-12', 'gfgf@naver.com', '디자인/캐릭터/만화', 'sds', 'ds', 'ds', '1498271237177.jpg', '2017-06-24 11:27:17', NULL),
	('join01', '123123', '참여자2', '01030325621', '2017-06-02', 'rksdi@fmdi', '디자인/캐릭터/만화', 'dd', 'd', 'dsds', '1498271305019.jpg', '2017-06-24 11:28:25', NULL),
	('join03', '123123', '참여자4', '01030325621', '2017-06-02', 'rksdi@fmdi', '디자인/캐릭터/만화', 'dd', 'd', 'dsds', '1498271305019.jpg', '2017-06-24 11:28:25', NULL),
	('join11', '123123', '참여자', '01030325621', '2017-06-02', 'rksdi@fmdi', '디자인/캐릭터/만화', 'dd', 'd', 'dsds', '1498271305019.jpg', '2017-06-24 11:28:25', NULL),
	('join2', '123123', '참여자3', '01030325621', '2017-06-02', 'rksdi@fmdi', '디자인/캐릭터/만화', 'dd', 'd', 'dsds', '1498271305019.jpg', '2017-06-24 11:28:25', NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;


-- 테이블 contest.work 구조 내보내기
CREATE TABLE IF NOT EXISTS `work` (
  `w_id` int(11) NOT NULL AUTO_INCREMENT,
  `w_name` varchar(100) NOT NULL,
  `w_result` varchar(100) DEFAULT NULL,
  `w_content` text,
  `r_id` int(11) DEFAULT '0',
  PRIMARY KEY (`w_id`),
  KEY `r_id` (`r_id`),
  CONSTRAINT `r_id` FOREIGN KEY (`r_id`) REFERENCES `receipt` (`r_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- 테이블 데이터 contest.work:~3 rows (대략적) 내보내기
/*!40000 ALTER TABLE `work` DISABLE KEYS */;
INSERT INTO `work` (`w_id`, `w_name`, `w_result`, `w_content`, `r_id`) VALUES
	(1, '우리팀연하카드', '0', '<p>타코타코</p>', 1),
	(2, '새해를울리는 연하카드', '0', '<p>졸업가능하나</p>', 2),
	(3, '수체화연하카드', '0', '<p>졸업가능하나</p>', 3);
/*!40000 ALTER TABLE `work` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
