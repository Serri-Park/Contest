package yjc.wdb.second;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.List;
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

	
	//ï¿½ëœï¿½ë£ï¿½ì‚• ï¿½ë›¾ï¿½ë£Šï¿½ì‚•
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
		List<ClaimantVo> Colist = tservice.TeamRoomContest(t_id, leader);
		int ConlCount = Colist.size();
		
		Manager manage = eservice.config(t_id);
	      if(manage!=null){
	      System.out.println("Æò°¡¹æ¹ı:"+manage.getEp_how());
	      model.addAttribute("manage",manage);
	      }
		model.addAttribute("ConlCount",ConlCount);
		model.addAttribute("Colist",Colist);
		
		ClaimantVo vos = new ClaimantVo();
		vos.setT_id(t_id);
		List<ClaimantVo> list = tservice.teammember(vos);
		model.addAttribute("list",list);
		 return"Team/teamRoom";
	}
	
	//ï¦«ëš®?…„ç¶?ï¿½ï¿½?œ? ï¿?? ï¿½ëœï¿½ë£ï¿½ì‚• ï¿½ì†»æ´¹ï½‹?ƒï¿½êµ¢ï¿½ê·¦?–Š?ï¿½ëœï¿½ë£ï¿½ì‚•ï¿½ëœ? ï¿??
	@RequestMapping(value = "AllTeamList", method = {RequestMethod.GET, RequestMethod.POST})
	public String Teamlist(@RequestParam(value="Conlist",defaultValue="1")int Conlist,
			@RequestParam(value="permit",defaultValue="1")int permit,
			@RequestParam(value="search",defaultValue="All")String search,
			TeamVo vo, Model model, HttpSession session) throws Exception{

		String u_id = (String)session.getAttribute("u_id");
		List<TeamVo> tlist = tservice.teamchek(u_id);
		int number = tlist.size();
		System.out.println(u_id);
		
		model.addAttribute("num",number);
		model.addAttribute("tlist",tlist);
		
		vo.setSearchType(search);
		vo.setConlist(Conlist);
		vo.setU_id(u_id);
		model.addAttribute("search",vo);
		List<TeamVo> list = tservice.AllTeamList(vo);
		int listnum = list.size();
		model.addAttribute("Conlist",Conlist);
		model.addAttribute("listnum",listnum);
		model.addAttribute("list",list);
		model.addAttribute("permit",permit);
		
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
	
	//ï¿½ëœï¿½ëŸ¥?ˆ°ë½©ëœï¿½ëŸ¥?ˆ°?¥ëœï¿½ëŸ¥å½›ï¿½ ï¿½ëœï¿½ë£ï¿½ì‚• ï¿½ì†»æ´¹ï½‹?ƒï¿½êµ¢ï¿½ê·¦?–Š?ï¿½ëœï¿½ë£ï¿½ì‚•ï¿½ëœ? ï¿??
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
	
	//ï¿½ë¤†ï¿½ë£Šï¿½ì‚•ï¿½ëœï¿½ëŸ©?‚‰ï¿½ï¿½?œï¿½ëŸ¥ï§‘ìšœì¶?ç¯?ë¥ì‚•
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
	
	//ï¿½ëœï¿½ëŸ¥ï§‘ìšœì¶?ç¯?ë¥ì‚•ï¿½ëœï¿½ëŸ©ï¿½ê²± claimant
	@RequestMapping(value = "claimant", method = RequestMethod.GET)
	public String claimants(@RequestParam(value="t_id",defaultValue="-1")int t_id,ClaimantVo vo,Model model, HttpSession session) throws Exception{
		
		model.addAttribute("t_id",t_id);	
		TeamVo teamvo = new TeamVo();
		
		teamvo =  tservice.permitlook(t_id);
		model.addAttribute("permit",teamvo);
		List<ClaimantVo> list = tservice.claimant(vo);
		int number = list.size();
		model.addAttribute("num",number);
		model.addAttribute("clailist",list);
	return"Team/claimant";
	}
	
	//ï¿½ë¤†ï¿½ë£Šï¿½ì‚•ï¿½ëœï¿½ëŸ©?‚‰ï¿½ï¿½?œï¿½ëŸ¥ï¿½ë¹¢ï¿½ëœï¿½ëŸ©?¾ï¿½
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
	
	
	//ï¿½ë¤†ï¿½ë£Šï¿½ì‚•ï¿½ëœï¿½ëŸ©?‚‰ï¿½ï¦„ê³Œì‘¨ï¿½ï¿½?ï¿½ëœï¿½ë£ï¿½ì‚•
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
		//ï¿½ëœï¿½ëŸ¡ï¿½ë®ï¿½ëœï¿½ëŸ¥ï¿½ë–„
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
		//ï¿½ëœï¿½ë£ï¿½ì‚•ï¿½ëœï¿½ëŸ¡ï§ë?£ëœï¿½ëŸ¡?‡¾ï¿?
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
		
		
}
