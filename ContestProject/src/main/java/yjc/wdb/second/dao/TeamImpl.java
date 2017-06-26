package yjc.wdb.second.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import yjc.wdb.second.bean.ClaimantVo;
import yjc.wdb.second.bean.MessageVo;
import yjc.wdb.second.bean.TeamVo;



@Repository
public class TeamImpl implements TeamDao {
	
	@Inject
	private SqlSession sql;
	private static String namespace ="yjc.wdb.team.teamMapper";
	private static String namespace2 = "yjc.wdb.team.claimantMapper";
	private static String namespace3 = "yjc.wdb.second.MessageMapper";
	
	//team 占쎈쑓占쎌뵠占쎄숲
	@Override
	public TeamVo teamData(TeamVo vo) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne(namespace+".teamData",vo);
	}

	
	@Override
	public void insertTeam(TeamVo vo) throws Exception {
		// TODO Auto-generated method stub
		sql.insert(namespace+".insertTeam",vo);
	}

	@Override
	public TeamVo check(String teamName) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne(namespace+".TnameChck",teamName);
	}
	
	@Override
	public List<TeamVo> listAll(TeamVo vo) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList(namespace+".AllTeamList",vo);
	}
	
	@Override
	public List<TeamVo> listhost(TeamVo vo) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList(namespace+".listhost",vo);
	}
	
	@Override
	public List<TeamVo> Listguest(TeamVo vo) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList(namespace+".Listguest",vo);
	}
	
	
	//揶쏉옙占쎌뿯占쎈쭆 占쏙옙占쎌뱽 占쎌넇占쎌뵥占쎈릭疫꿸퀣�맄占쎈립 占쎄퐣�뜮袁⑸뮞
	@Override
	public List<TeamVo> teamchek(String u_id) throws Exception {
		// TODO Auto-generated method stub
	
		return sql.selectList(namespace+".teamchek",u_id);
	}
	
	
	//TeamMember(team_user)
	@Override
	public void addTeamMember(TeamVo vo) throws Exception {
		// TODO Auto-generated method stub
		sql.insert(namespace+".addTeamUser",vo);
	}
	
	//team_id search
	@Override
	public int team_id(TeamVo vo) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne(namespace+".team_id",vo);
	}
	
	//myTeam
	@Override
	public List<TeamVo> myTeams(TeamVo vo) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList(namespace+".myteamlist",vo);
	}

	
	//userRights
	@Override
	public TeamVo userRights(TeamVo vo) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne(namespace+".Rights",vo);
	}

	//占쎈뻿筌ｏ옙占쎌쁽癰귣떯由�
	@Override
	public List<ClaimantVo> claimant(ClaimantVo vo) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList(namespace2+".claimant",vo);
	}

	//揶쏉옙占쎌뿯占쎈땾占쎌뵭
	@Override
	public void rightsUp(ClaimantVo vo) throws Exception {
		// TODO Auto-generated method stub
		sql.update(namespace2+".rightsUp",vo);
	}

	//揶쏉옙占쎌뿯 占쎈땾占쎌뵭占쎈뻻 占쏙옙占쎌삢占쎌벥 亦낅슦釉놂옙�뱽 癰귣떯�� 占쏙옙占쎌뜚占쎌벥 亦낅슦釉놂옙�굢占쎈립 占쎌젟占쎈퉸筌욊쑬�뼄.
	@Override
	public int leaderRights(int t_id) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne(namespace+".leaderRights",t_id);
	}

	@Override
	public List<ClaimantVo> teammember(ClaimantVo vo) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList(namespace2+".user",vo);
	}

	//揶쏉옙占쎌뿯椰꾧퀣�쟿
	@Override
	public void rightsNo(ClaimantVo vo) throws Exception {
		// TODO Auto-generated method stub
		sql.delete(namespace2+".rightsNo",vo);
	}

	
	
	//占쏙옙占쎌벥 占쎄맒占쎄묶�몴占� �뚢뫂�뱜嚥∽옙 占쎈릭疫뀐옙 占쎌맄占쎈퉸 permit占쎌뱽 筌≪뼔�뮉占쎈뼄.
	@Override
	public TeamVo permitlook(int t_id) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne(namespace+".permitlook",t_id);
	}

	//
	@Override
	public void permitup(TeamVo vo) throws Exception {
		sql.update(namespace+".permitup",vo);
		
	}

	//占쎄퉱占쎈닚
	@Override
	public void dropoutTeam(TeamVo vo) throws Exception {
		// TODO Auto-generated method stub
		sql.update(namespace+".dropoutTeam",vo);
	}

	
	//teamRoom contest list

	@Override
	public List<ClaimantVo> guestContest(int t_id) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList(namespace2+".guestContest",t_id);
	}


	@Override
	public List<ClaimantVo> hostContest(int t_id) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList(namespace2+".hostContest",t_id);
	}


	@Override
	public List<ClaimantVo> Myschedule(ClaimantVo vo) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList(namespace2+".Myschedule",vo);
	}


	@Override
	public List<TeamVo> JoinTotal(TeamVo vo) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList(namespace+".JoinCount",vo);
	}

	
	//RecommendUsetList
	@Override
	public List<MessageVo> RecommendUsetList(MessageVo vo) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList(namespace3+".RecommendUsetList",vo);
	}


	//InvitationMake
	@Override
	public void InvitationMake(MessageVo vo) throws Exception {
		// TODO Auto-generated method stub
		sql.insert(namespace3+".messageMake",vo);
	}
	
	@Override
	public void receiverMake(MessageVo vo) throws Exception {
		// TODO Auto-generated method stub
		sql.insert(namespace3+".receiverMake",vo);
	}
	//


	@Override
	public void MemberInvitation(MessageVo vo) throws Exception {
		// TODO Auto-generated method stub
		sql.insert(namespace3+".MemberInvitation",vo);
	}


	@Override
	public List<MessageVo> invitationMassge(String rc_id) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList(namespace3+".invitationMassge",rc_id);
	}

	
	//transinvitationM
	@Override
	public List<MessageVo> transinvitationM(int t_id) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList(namespace3+".transinvitationM",t_id);
	}

	
	//read
	@Override
	public MessageVo content(MessageVo vo) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne(namespace3+".content",vo);
	}

	//messageRead Date update
	@Override
	public void messageRead_Date(MessageVo vo) throws Exception {
		sql.update(namespace3+".messageRead_Date",vo);
		
	}
	//


	@Override
	public List<TeamVo> MemberTeam(TeamVo vo) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList(namespace+".MemberTeam",vo);
	}
	
	//CountMessage
		@Override
		public int CountMessage(String rc_id) throws Exception {
			// TODO Auto-generated method stub
			return sql.selectOne(namespace3+".CountMessage",rc_id);
		}

}
