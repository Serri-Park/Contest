package yjc.wdb.second.service;



import java.util.List;

import yjc.wdb.second.bean.ClaimantVo;
import yjc.wdb.second.bean.TeamVo;



public interface TeamService {
	public TeamVo teamData(TeamVo vo) throws Exception;
	public void insertTeam(TeamVo vo) throws Exception;
	public TeamVo check(String t_name) throws Exception;
	public List<TeamVo> AllTeamList(TeamVo vo) throws Exception;
	public List<TeamVo> teamchek(String m_id) throws Exception;
	public void addTeamMember(TeamVo vo) throws Exception;
	public List<TeamVo> myTeams(TeamVo vo) throws Exception;
	public TeamVo userRights(TeamVo vo) throws Exception;
	//팀 가입 현황
	public List<TeamVo>JoinTotal(TeamVo vo) throws Exception;
	//占쎈뻿筌ｏ옙占쎌쁽 筌≪뼐由�
		public List<ClaimantVo> claimant(ClaimantVo vo) throws Exception;
		
		//揶쏉옙占쎌뿯占쎈땾占쎌뵭
		public void rightsUp(ClaimantVo vo) throws Exception;
		//揶쏉옙占쎌뿯椰꾧퀣�쟿
		public void rightsNo(ClaimantVo vo) throws Exception;
		
		//揶쏉옙占쎌뿯 占쎈땾占쎌뵭占쎈뻻 占쏙옙占쎌삢占쎌벥 亦낅슦釉놂옙�뱽 癰귣떯�� 占쏙옙占쎌뜚占쎌벥 亦낅슦釉놂옙�굢占쎈립 占쎌젟占쎈퉸筌욊쑬�뼄.
		public int leaderRights(int t_id) throws Exception;
		
		
	public List<ClaimantVo> teammember(ClaimantVo vo) throws Exception;
	
	//占쎄퉱占쎈닚
	public void dropoutTeam(TeamVo vo) throws Exception;  
	
	//占쏙옙占쎌벥 占쎄맒占쎄묶�몴占� �뚢뫂�뱜嚥∽옙 占쎈릭疫뀐옙 占쎌맄占쎈퉸 permit占쎌뱽 筌≪뼔�뮉占쎈뼄.
	public TeamVo permitlook(int t_id) throws Exception;
	
	public void permitup(TeamVo vo) throws Exception;
	
	public List<ClaimantVo> TeamRoomContest(int t_id,int leader) throws Exception;
	
	//Myschedule
		public List<ClaimantVo> Myschedule(ClaimantVo vo) throws Exception;
}
