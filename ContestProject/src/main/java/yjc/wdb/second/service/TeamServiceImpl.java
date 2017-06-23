package yjc.wdb.second.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import yjc.wdb.second.bean.ClaimantVo;
import yjc.wdb.second.bean.TeamVo;
import yjc.wdb.second.dao.TeamDao;



@Service
public class TeamServiceImpl implements TeamService {
	
	@Inject
	private TeamDao dao;

	@Override
	public TeamVo teamData(TeamVo vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.teamData(vo);
	}
	
	@Override
	public void insertTeam(TeamVo vo) throws Exception {
		// TODO Auto-generated method stub
		dao.insertTeam(vo);
		int t_id =  dao.team_id(vo);
		vo.setT_id(t_id);
		System.out.println(vo.getT_id());
		dao.addTeamMember(vo);	
	}

	@Override
	public TeamVo check(String teamName) throws Exception {
		// TODO Auto-generated method stub
		return dao.check(teamName);
	}
	
	//筌뤴뫀諭� 占쏙옙
	@Override
	public List<TeamVo> AllTeamList(TeamVo vo) throws Exception {
		// TODO Auto-generated method stub
	   if(vo.getConlist() != 0){
		   if(vo.getConlist() == 1){
			   return dao.Listguest(vo);
		   }else if(vo.getConlist() == 3){
			   return dao.listhost(vo);
		   }
		   
	   }  
		   	   
		return dao.listAll(vo);   
	}
	
	//揶쏉옙占쎌뿯占쎈쭆 占쏙옙 占쎌넇占쎌뵥
	@Override
	public List<TeamVo> teamchek(String u_id) throws Exception {
		// TODO Auto-generated method stub
	
		return dao.teamchek(u_id);
	}
	
	//user占쎌벥 team揶쏉옙占쎌뿯
	@Override
	public void addTeamMember(TeamVo vo) throws Exception {
		// TODO Auto-generated method stub
		dao.addTeamMember(vo);
	}
	
	//占쎄돌占쎌벥 占쏙옙�뵳�딅뮞占쎈뱜
	@Override
	public List<TeamVo> myTeams(TeamVo vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.myTeams(vo);
	}
	
	//userRights
	@Override
	public TeamVo userRights(TeamVo vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.userRights(vo);
	}
	
	//占쎈뻿筌ｏ옙占쎌쁽癰귣떯由�
	@Override
	public List<ClaimantVo> claimant(ClaimantVo vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.claimant(vo);
	}
	
	//揶쏉옙占쎌뿯占쎈땾占쎌뵭
	@Override
	public void rightsUp(ClaimantVo vo) throws Exception {
		// TODO Auto-generated method stub
		dao.rightsUp(vo);
	}
	
	//揶쏉옙占쎌뿯 占쎈땾占쎌뵭占쎈뻻 占쏙옙占쎌삢占쎌벥 亦낅슦釉놂옙�뱽 癰귣떯�� 占쏙옙占쎌뜚占쎌벥 亦낅슦釉놂옙�굢占쎈립 占쎌젟占쎈퉸筌욊쑬�뼄.
	@Override
	public int leaderRights(int t_id) throws Exception {
		// TODO Auto-generated method stub
		return dao.leaderRights(t_id);
	}

	@Override
	public List<ClaimantVo> teammember(ClaimantVo vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.teammember(vo);
	}

	@Override
	public void rightsNo(ClaimantVo vo) throws Exception {
		// TODO Auto-generated method stub
		dao.rightsNo(vo);
	}
	
	
	
	//占쏙옙占쎌벥 占쎄맒占쎄묶�몴占� �뚢뫂�뱜嚥∽옙 占쎈릭疫뀐옙 占쎌맄占쎈퉸 permit占쎌뱽 筌≪뼔�뮉占쎈뼄.
	@Override
	public TeamVo permitlook(int t_id) throws Exception {
		// TODO Auto-generated method stub
		return dao.permitlook(t_id);
	}

	@Override
	public void permitup(TeamVo vo) throws Exception {
		dao.permitup(vo);
		
	}

	//占쎄퉱占쎈닚
	@Override
	public void dropoutTeam(TeamVo vo) throws Exception {
		dao.dropoutTeam(vo);
		
	}

	@Override
	public List<ClaimantVo> TeamRoomContest(int t_id, int leader) throws Exception {
		if(leader == 1){
			return dao.guestContest(t_id);
		}else if(leader == 3){
			return dao.hostContest(t_id);
		}
		return null;
	}

	
	@Override
	public List<ClaimantVo> Myschedule(ClaimantVo vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.Myschedule(vo);
	}

	@Override
	public List<TeamVo> JoinTotal(TeamVo vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.JoinTotal(vo);
	}



	

	

}
