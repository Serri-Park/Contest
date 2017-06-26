package yjc.wdb.second;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpRequest;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import yjc.wdb.second.bean.ClaimantVo;
import yjc.wdb.second.bean.Manager;
import yjc.wdb.second.bean.Member;
import yjc.wdb.second.bean.MessageVo;
import yjc.wdb.second.bean.TeamVo;
import yjc.wdb.second.bean.Userbean;
import yjc.wdb.second.service.EvaluationService;
import yjc.wdb.second.service.TeamService;
import yjc.wdb.second.service.memberService;
import yjc.wdb.second.util.UploadFileUtil;
import yjc.wdb.second.util.MediaUtils;




@SessionAttributes("u_id")


@Controller
public class teamController {
	private static final Logger logger = LoggerFactory.getLogger(teamController.class);
	@Resource(name="uploadPath")
	private String uploadPath;
	@Inject
	private memberService service;
	@Inject
	private TeamService tservice;
	
	@Inject
	private EvaluationService eservice;
	@RequestMapping(value = "registTeam", method = RequestMethod.GET)
	public String registForm(@RequestParam(value="Conlist",defaultValue="1")int Conlist, TeamVo vo, 
			Model model, HttpSession session,Userbean vo1) throws Exception{
		
		String id=(String)session.getId();
		vo1.setU_id(id);
		vo.setConlist(Conlist);
		model.addAttribute("teamDate",vo);
		
		return "Team/registForm";
	}
	
	
	@RequestMapping(value = "registTeam", method = RequestMethod.POST)
	public String Teamregist(MultipartFile file,TeamVo vo, HttpSession session, Model model, RedirectAttributes rttr) throws Exception{
		//file upload
		logger.debug("uploadForm Requested");
		logger.info("originalName:"+file.getOriginalFilename());
		logger.info("size:"+file.getSize());
		logger.info("contentType : "+file.getContentType());
		logger.info("server FileName : "+file.getName());

		String savedName = UploadFileUtil.uploadFile(file.getOriginalFilename() ,uploadPath,file.getBytes());
		model.addAttribute("savedName", savedName);
		vo.setT_logo(savedName);
		

		//
		String u_id = (String) session.getAttribute("u_id");
		System.out.println(u_id + "u+id");
		vo.setU_id(u_id);

		System.out.println(vo.getU_id() + "u+id");
		tservice.insertTeam(vo);
		int t_id = vo.getT_id();
		rttr.addFlashAttribute("result", "SUCCESS");
		return "redirect:teamRoom?t_id="+t_id;
	}
	
	@ResponseBody
	@RequestMapping("displayTeamFile")
	public ResponseEntity<byte[]> displayTeamFile(String fileName) throws Exception{
		ResponseEntity<byte[]> entity = null;
		String ext = fileName.substring(fileName.lastIndexOf(".")+1);
		
		MediaType mediaType = MediaUtils.getMediaType(ext);
		
		InputStream in = null;
		
		logger.info("File Name: " + fileName);
		
		HttpHeaders headers = new HttpHeaders();
		//uploadPath : resources/upload
		//fileName : /2017/05/18/ThumbNail_rose_XXXXX.jpg
		try{
			in = new FileInputStream(uploadPath+fileName);
			if(mediaType != null){
				headers.setContentType(mediaType);
			}else{
				fileName = fileName.substring(fileName.indexOf("_")+1);
				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
				String fN = new String(fileName.getBytes("UTF-8"),"ISO-8859-1");
				headers.add("Content-Disposition", "attachment; filename=\""+fN+"\"");
			}
			byte[] data = IOUtils.toByteArray(in);
			entity = new ResponseEntity<byte[]>(data, headers, HttpStatus.CREATED);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}finally{
			in.close();
		}
		
		return entity;
	}

	
	//占쎈쐻占쎈짗占쎌굲 占쎈쎗占쎈즸占쎌굲
	@RequestMapping(value = "teamRoom", method = RequestMethod.GET)
	public String 	list(@RequestParam(value="t_id")int t_id,TeamVo vo,Model model, HttpSession session) throws Exception{
		//TeamVo vo2 = new TeamVo();
		
		
		model.addAttribute("t_id",t_id);	
		String u_id = (String) session.getAttribute("u_id");
		vo.setT_id(t_id);
		vo.setU_id(u_id);
		
		
		vo = tservice.teamData(vo);
		model.addAttribute("teamDate",vo);
		
		TeamVo vo2 = new TeamVo();
		vo2.setT_id(t_id);
		vo2.setU_id(u_id);
		vo2 = tservice.userRights(vo2);
		model.addAttribute("Rights",vo2);
		int leader = tservice.leaderRights(t_id);
		model.addAttribute("leader",leader);
		
		Manager manage = eservice.config(t_id);
		if(manage!=null){
		System.out.println("평가방법:"+manage.getEp_how());
		model.addAttribute("manage",manage);
		}
		
		ClaimantVo vos = new ClaimantVo();
		vos.setT_id(t_id);
		List<ClaimantVo> list = tservice.teammember(vos);
		model.addAttribute("list",list);
		 return"Team/teamRoom";
	}
	
	//癲ル슢?占쏙옙占�?占쏙옙?占쏙옙?占쏙옙占�?? 占쎈쐻占쎈짗占쎌굲 占쎌녃域뱄퐢?占쏙옙占쎄덩占쎄랩?占쏙옙?占쎈쐻占쎈짗占쎌굲占쎈쐻?占쏙옙占�??
	@RequestMapping(value = "AllTeamList", method = RequestMethod.GET)
	public String Teamlist(@RequestParam(value="Conlist",defaultValue="1")int Conlist,
			@RequestParam(value="searchRights",defaultValue="0")int searchRights,
			@RequestParam(value="keyword",defaultValue="All")String keyword,
			@RequestParam(value="permit",defaultValue="1")int permit,
			@RequestParam(value="searchFile",defaultValue="All")String searchFile,
			@RequestParam(value="searchAreas",defaultValue="All")String searchAreas,
			TeamVo vo, Model model, HttpSession session) throws Exception{
		

		String u_id = (String)session.getAttribute("u_id");
		List<TeamVo> tlist = tservice.teamchek(u_id);
		int number = tlist.size();
		System.out.println(number+"dasdad");
		model.addAttribute("num",number);
		model.addAttribute("tlist",tlist);
		
		vo.setSearchAreas(searchAreas);
		vo.setSearchTypeFile(searchFile);
		vo.setConlist(Conlist);
		vo.setU_id(u_id);
		vo.setSearchRights(searchRights);
		vo.setKeyword(keyword);
		model.addAttribute("search",vo);
		List<TeamVo> list = tservice.AllTeamList(vo);
		int listnum = list.size();
		model.addAttribute("Conlist",Conlist);
		model.addAttribute("listnum",listnum);
		model.addAttribute("list",list);
		model.addAttribute("permit",permit);
		System.out.println(permit+"ddd");
		
	return "Team/TeamList";
		
	}
	@RequestMapping(value = "MyTeamJoinTotal", method = {RequestMethod.GET, RequestMethod.POST})
	public String MyTeamJoinTotal(@RequestParam(value="Conlist",defaultValue="0")int Conlist,
			@RequestParam(value="search",defaultValue="All")String search,
			TeamVo vo,Model model, HttpSession session,HttpServletRequest req) throws Exception{
		
		String u_id = (String)session.getAttribute("u_id");
	/*	List<TeamVo> tlist = tservice.teamchek(u_id);
		int number = tlist.size();
	
		model.addAttribute("num",number);
		model.addAttribute("tlist",tlist);
		*/
		vo.setU_id(u_id);
		/*vo.setSearchType(search);
		vo.setConlist(Conlist);
		
		
		model.addAttribute("search",vo);*/
		List<TeamVo> list = tservice.JoinTotal(vo);
		int listnum = list.size();
		model.addAttribute("listnum",listnum);
		model.addAttribute("lists",list);
		
	return "Team/TeamJoinTotal";
		
	}
	
	//占쎈쐻占쎈윥?占쏙옙戮⑸쐻占쎈윥?占쏙옙?占쎈쐻占쎈윥壤쏉옙 占쎈쐻占쎈짗占쎌굲 占쎌녃域뱄퐢?占쏙옙占쎄덩占쎄랩?占쏙옙?占쎈쐻占쎈짗占쎌굲占쎈쐻?占쏙옙占�??
		@RequestMapping(value = "myTeams", method = RequestMethod.GET)
		public String MyTeamlist(TeamVo vo,Model model, HttpSession session) throws Exception{
			String u_id = (String)session.getAttribute("u_id");
			vo.setU_id(u_id);
			List<TeamVo> mylist = tservice.myTeams(vo);
			int num = mylist.size();
			model.addAttribute("num",num);
			model.addAttribute("mylist",mylist);
    return"Team/myTeams";
		}
	
	
	@RequestMapping(value="nameCheck", method = RequestMethod.POST)
	@ResponseBody
	public String nameCheck(@RequestParam("teamname")String teamname) throws Exception{
		String str = "";
		if(tservice.check(teamname)==null){
			str="true";
		}
		
		return str;
	}
	
	//占쎈쨬占쎈즸占쎌굲占쎈쐻占쎈윪?占쏙옙占쏙옙?占쏙옙占쎈윥筌묒슌占�?占�?瑜곸굲
	@RequestMapping(value="joinTeam", method = RequestMethod.POST)
	@ResponseBody
	public String joinTeam(TeamVo vo, HttpServletRequest req ,HttpSession session){
		int t_id = Integer.parseInt(req.getParameter("t_id"));
		vo.setT_id(t_id);
		String entity =null;
		String m_id = (String)session.getAttribute("u_id");
		vo.setU_id(m_id);
		int rig = 10;
		vo.setM_rights(rig);
		try{
		tservice.addTeamMember(vo);
		entity = "SUCCESS";
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return entity;
	}
	
	//占쎈쐻占쎈윥筌묒슌占�?占�?瑜곸굲占쎈쐻占쎈윪占쎄껑 claimant
	@RequestMapping(value = "Team/claimant", method = RequestMethod.GET)
	public String claimants(@RequestParam(value="t_id")int t_id,@RequestParam(value="m_rights",defaultValue="3")int m_rights,
			@RequestParam(value="t_filed",defaultValue="All")String t_filed,
			 TeamVo teamDate,ClaimantVo vo,Model model, HttpSession session) throws Exception{
		
		teamDate.setT_id(t_id);
		teamDate.setM_rights(m_rights);
		teamDate.setT_filed(t_filed);
		model.addAttribute("teamDate",teamDate);	
		
		
		TeamVo teamvo = new TeamVo();
		
		teamvo =  tservice.permitlook(t_id);
		model.addAttribute("permit",teamvo);
		List<ClaimantVo> list = tservice.claimant(vo);
		int number = list.size();
		model.addAttribute("num",number);
		model.addAttribute("clailist",list);
	return"Team/claimant";
	}
	
	//占쎈쨬占쎈즸占쎌굲占쎈쐻占쎈윪?占쏙옙占쏙옙?占쏙옙占쎈윥占쎈묄占쎈쐻占쎈윪?占쏙옙
	@RequestMapping(value="userOk", method = RequestMethod.POST)
	@ResponseBody
	public String userOk(ClaimantVo vo, HttpServletRequest req ,HttpSession session) throws Exception{
		
		String u_id = req.getParameter("u_id");
		int t_id = Integer.parseInt(req.getParameter("t_id"));
		int rights= tservice.leaderRights(t_id);
		
		vo.setT_id(t_id);
		vo.setU_id(u_id);

		String entity =null;
		int rig = 0;
		if(rights == 1){
			rig = 2;
		}else if(rights == 3){
			rig = 4;
		}
		vo.setM_rights(rig);
		tservice.rightsUp(vo);
		entity = "SUCCESS";	

		return entity;
	}
	
	
	//占쎈쨬占쎈즸占쎌굲占쎈쐻占쎈윪?占쏙옙占쏙쫫怨뚯뫅占쏙옙?占쎈쐻占쎈짗占쎌굲
		@RequestMapping(value="userNo", method = RequestMethod.POST)
		@ResponseBody
		public String userNo(ClaimantVo vo, HttpServletRequest req ,HttpSession session){
			String u_id = req.getParameter("u_id");
			if(u_id == null){
				u_id = (String)session.getAttribute("u_id");
			}

			int t_id = Integer.parseInt(req.getParameter("t_id"));
			vo.setT_id(t_id);
			vo.setU_id(u_id);
			String entity =null;
			try{
			tservice.rightsNo(vo);
			entity = "SUCCESS";
			}catch (Exception e) {
				// getRights
				e.printStackTrace();
			}

			return entity;
		}
		//占쎈쐻占쎈윞占쎈룼占쎈쐻占쎈윥占쎈뻹
		@RequestMapping(value="dropoutTeam", method = RequestMethod.POST)
		@ResponseBody
		public String dropoutTeam(TeamVo vo, HttpServletRequest req ,HttpSession session)throws Exception{
			String u_id = (String)session.getAttribute("u_id");
			int t_id = Integer.parseInt(req.getParameter("t_id"));
			vo.setT_id(t_id);
			vo.setU_id(u_id);
			String entity =null;
			tservice.dropoutTeam(vo);
			entity = "SUCCESS";

			return entity;
		}
		//占쎈쐻占쎈짗占쎌굲占쎈쐻占쎈윞筌랃옙?占쎈쐻占쎈윞?占쏙옙占�?
				@RequestMapping(value="Recruitcont", method = RequestMethod.POST)
				@ResponseBody
				public String Recruitcont(TeamVo vo, HttpServletRequest req ,HttpSession session){
					
					int t_id = Integer.parseInt(req.getParameter("t_id"));
					int permit =  Integer.parseInt(req.getParameter("permit"));
					vo.setT_permit(permit);
					vo.setT_id(t_id);
					
					String entity =null;
					try{
					tservice.permitup(vo);
					entity = "SUCCESS";
					}catch (Exception e) {
						// TODO: handle exception
						e.printStackTrace();
					}

					return entity;
				}
		
		
		
		//추천인받기
				@ResponseBody
				@RequestMapping(value="Team/recommend", method = RequestMethod.GET)
				public ResponseEntity<Map<String,Object>> MassageMakeForm(MessageVo vo, HttpSession session, Model model,HttpServletRequest req) throws Exception{
					ResponseEntity<Map<String,Object>> entity = null;
					
					String t_filed = req.getParameter("t_filed");
			
					int t_id = Integer.parseInt(req.getParameter("t_id"));
					
					vo.setT_id(t_id);
					vo.setT_filed(t_filed);
						
					List<MessageVo> list = tservice.RecommendUsetList(vo);			
					int count = list.size();
					System.out.println(count);
					Map<String, Object> map = new HashMap<String, Object>();
					map.put("list", list);
					entity = new ResponseEntity<>(map,HttpStatus.OK);
						
						
							
					return entity;
					
								
				}			
			
				@RequestMapping(value="Team/InvitationMakeForm", method = RequestMethod.GET)
				public void InvitationMakeForm(
						@RequestParam(value="rc_id")String rc_id,
						@RequestParam(value="t_id")int t_id,
						MessageVo vo, HttpSession session, Model model) throws Exception{
						System.out.println("MfORM rc_id="+rc_id);
						
						vo.setRc_id(rc_id);
						model.addAttribute("rc_id",rc_id);
						
						vo.setT_id(t_id);
						int Rights = tservice.leaderRights(t_id);
						TeamVo team = tservice.teamData(vo);
						team.setM_rights(Rights);
						model.addAttribute("MakeDate",team);
						
					
					
				}
				
				@RequestMapping(value="Team/InvitationMake", method = RequestMethod.POST)
				public String MassageMake(MessageVo vo, HttpSession session, Model model) throws Exception{
					int ppctor = vo.getT_id();
					System.out.println(ppctor +"t_id");
					
					String send_id = (String) session.getAttribute("u_id");
					
					vo.setSend_id(send_id);
					tservice.InvitationMake(vo);
					return "redirect:post?ppctor="+ppctor;

				}
				
				@RequestMapping(value = "Team/post", method = RequestMethod.GET)
				public void post(@RequestParam(value="ppctor",defaultValue="0")int ppctor,
						@RequestParam(value="m_rights",defaultValue="11")int m_rights,
						MessageVo vo, HttpSession session, Model model,HttpServletRequest req) throws Exception{
					//post page controll
					// 0 = user, etc = teamleader
					int MessageCount = ppctor;
					System.out.println(MessageCount);
					TeamVo TeamDate = new TeamVo();
					

					//table
					int Count = 0;
					List<MessageVo> list = null;
					List<TeamVo> TeamList = null;
					System.out.println("ppctor은 "+MessageCount);
					//postPageContorll;
					if(MessageCount == 0){
					
						//session
						String rc_id = (String) session.getAttribute("u_id");
						TeamList = tservice.teamchek(rc_id);
						
						list = tservice.invitationMassge(rc_id);
						Count = list.size();
						TeamDate.setT_id(MessageCount);
						
					}else if(MessageCount != 0){
							
							vo.setT_id(MessageCount);
							TeamList = tservice.MemberTeam(vo);
							TeamDate =  tservice.teamData(vo);
							TeamDate.setM_rights(tservice.leaderRights(MessageCount));
							//session id
							list = tservice.transinvitationM(MessageCount);
							Count = list.size();
							
							
					}
					int TeamSize = TeamList.size();
					model.addAttribute("TeamSize", TeamSize);
					model.addAttribute("TeamList", TeamList);
					model.addAttribute("ppctor",MessageCount);
					model.addAttribute("TeamDate",TeamDate);
					System.out.println(Count);
					System.out.println(list);
					
					model.addAttribute("count",Count);
					model.addAttribute("list",list);
					
				}
				
			@RequestMapping(value = "Team/messageRead", method = RequestMethod.GET)
			public void messageRead(@RequestParam(value="ms_id",defaultValue="-1")int ms_id,
					@RequestParam(value="ppctor",defaultValue="0")int ppctor,
					@RequestParam(value="i",defaultValue="0")int i,
					@RequestParam(value="t_id",defaultValue="0")int t_id,
				MessageVo vo, HttpSession session, Model model) throws Exception{
				model.addAttribute("ppctor",ppctor);
				if(ms_id == -1){
					return;
					}
					else if(ms_id > -1){
						
						//Message read date update
						String rc_id = (String) session.getAttribute("u_id");
						vo.setRc_id(rc_id);
						vo.setMs_id(ms_id);
						vo.setT_id(t_id);	
						int Rights = tservice.leaderRights(t_id);
						vo.setM_rights(Rights);
						System.out.println("rights : " + vo.getM_rights());
						System.out.println("t_ID : " + vo.getT_id());
						model.addAttribute("Inteam",vo);
						vo =  tservice.content(vo,i);
						
						model.addAttribute("u_id",rc_id);
						model.addAttribute("content",vo);
					}
				}
			
			
			
			@RequestMapping(value="Team/CountMessage", method = RequestMethod.GET)
			public ResponseEntity<Map<String,Object>> CountMessage(HttpServletRequest req,MessageVo vo, HttpSession session, Model model){
				ResponseEntity<Map<String,Object>> entity =null;
				//session
				String rc_id = (String) session.getAttribute("u_id");
				//String rc_id = req.getParameter("rc_id");
				
				try {
					int MassCount = tservice.CountMessage(rc_id);
					Map<String, Object> map = new HashMap<String, Object>();
					System.out.println("MassCount"+MassCount);
					map.put("MassCount", MassCount);
					//model.addAttribute("MassCount",MassCount);
					entity = new ResponseEntity<>(map,HttpStatus.OK);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
				}
				
				return entity;
			}
}
