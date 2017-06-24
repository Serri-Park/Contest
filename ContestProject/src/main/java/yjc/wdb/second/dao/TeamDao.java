package yjc.wdb.second.dao;


import java.util.List;

import yjc.wdb.second.bean.ClaimantVo;
import yjc.wdb.second.bean.MessageVo;
import yjc.wdb.second.bean.TeamVo;



public interface TeamDao {
	
	//select Team All
	public TeamVo teamData(TeamVo vo) throws Exception;
	public TeamVo userRights(TeamVo vo) throws Exception;
	public void insertTeam(TeamVo vo) throws Exception;
	public TeamVo check(String t_name) throws Exception;
	public List<TeamVo> listAll(TeamVo vo) throws Exception;
	public List<TeamVo> listhost(TeamVo vo) throws Exception; 
	public List<TeamVo> Listguest(TeamVo vo) throws Exception;
	//팀 가입 현황
	public List<TeamVo>JoinTotal(TeamVo vo) throws Exception;
	
	//select last_insert_id() from team;
	public int team_id(TeamVo vo) throws Exception;
	
	//TeamMember(team_user)
	public void addTeamMember(TeamVo vo) throws Exception;
	
	//繞벿살탮占쎄텢�뜝�럥彛� �뜝�룞�삕 嶺뚢돦堉먪뵳占�
	public List<TeamVo> teamchek(String m_id) throws Exception;
	
	//�뜝�럡�� �뜝�룞�삕 占쎈뎨占쎈봾裕욃뜝�럥諭�
	public List<TeamVo> myTeams(TeamVo vo) throws Exception;
	
	
//	//<!--  가입된 모든 팀의 정보를 띄워준다 띄워준다 -->
//	//<!-- TeamJoinTotall에서 이용한다 -->
//	public List<TeamVo> TeamJoinTotall(TeamVo vo) throws Exception;
//	
	//�뜝�럥六욜춯節륁삕�뜝�럩�겱 嶺뚢돦堉먪뵳占�
	public List<ClaimantVo> claimant(ClaimantVo vo) throws Exception;
	
	//�뤆�룊�삕�뜝�럩肉��뜝�럥�빢�뜝�럩逾�
	public void rightsUp(ClaimantVo vo) throws Exception;
	
	//�뤆�룊�삕�뜝�럩肉� �뜝�럥�빢�뜝�럩逾��뜝�럥六� �뜝�룞�삕�뜝�럩�궋�뜝�럩踰� 雅��굝�뒭�뇡�냲�삕占쎈굵 �솻洹ｋ뼬占쏙옙 �뜝�룞�삕�뜝�럩�쐸�뜝�럩踰� 雅��굝�뒭�뇡�냲�삕占쎄덩�뜝�럥由� �뜝�럩�젧�뜝�럥�돵嶺뚯쉳�뫊占쎈펲.
	public int leaderRights(int t_id) throws Exception;
	
	//�뤆�룊�삕�뜝�럩肉�濾곌쑨�ｏ옙�읉
	public void rightsNo(ClaimantVo vo) throws Exception;
		
	//�뜝�럡�돮�뜝�럥�떄
	public void dropoutTeam(TeamVo vo) throws Exception;
	
	//teammember
	public List<ClaimantVo> teammember(ClaimantVo vo) throws Exception;
	
	//�뜝�룞�삕�뜝�럩踰� �뜝�럡留믣뜝�럡臾띰옙紐닷뜝占� 占쎈슓維귨옙諭쒎슖�댙�삕 �뜝�럥由��뼨�먯삕 �뜝�럩留꾢뜝�럥�돵 permit�뜝�럩諭� 嶺뚢돦堉뷂옙裕됧뜝�럥堉�.
	public TeamVo permitlook(int t_id) throws Exception;
	//�뜝�룞�삕�뜝�럩踰� �뜝�럡留믣뜝�럡臾띰옙紐닷뜝占� �솻洹⑥삕�뇦猿뗰옙�뇡�냲�삕占쎈펲 permit
	public void permitup(TeamVo vo) throws Exception;
	
	
	//teamRoom contest list
	public List<ClaimantVo> guestContest(int t_id) throws Exception;
	public List<ClaimantVo> hostContest(int t_id) throws Exception;
	
	//Myschedule
	public List<ClaimantVo> Myschedule(ClaimantVo vo) throws Exception;
	
	//RecommendUsetList
	public List<MessageVo> RecommendUsetList(MessageVo vo) throws Exception;
		
}