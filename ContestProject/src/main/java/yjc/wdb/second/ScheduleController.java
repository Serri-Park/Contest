package yjc.wdb.second;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import yjc.wdb.second.bean.ClaimantVo;
import yjc.wdb.second.bean.Contest;
import yjc.wdb.second.bean.Schedule;
import yjc.wdb.second.bean.TeamVo;
import yjc.wdb.second.service.ScheduleService;




@SessionAttributes("u_id")
@Controller
public class ScheduleController {
	
	@Inject
	private ScheduleService service;
	
	@RequestMapping(value="/ScheMain", method = RequestMethod.GET)
	public String ScheMain(HttpServletRequest request,HttpSession session,Schedule svo,String id) throws Exception {
        session.removeAttribute(id);             
		session.setAttribute("id", svo.getU_id());
		session.setAttribute("t_id",svo.getT_id());
			return "Schedule/ScheMain";
	}
	
	@RequestMapping(value="/ScheMain", method = RequestMethod.POST)
	public String ScheMainPOST(Schedule svo,HttpSession session, @RequestParam(value = "s_start") String start
			, @RequestParam(value = "s_end") String end,RedirectAttributes rttr,Model model,@RequestParam("t_id")Integer t_id) throws Exception {
		try{
		String u_id=(String)session.getAttribute("u_id");
	      t_id=(Integer)session.getAttribute("t_id");
		TeamVo team=new TeamVo();
	  System.out.println(t_id);
		String title;
		String color;
		start = start.replace('/', '-');
		end = end.replace('/', '-');
		svo.setS_start(start);
		svo.setS_end(end);
		svo.setU_id(u_id);
		svo.setT_id(t_id);
		
				
		
		System.out.println(svo.toString());
		rttr.addFlashAttribute("id",u_id);
		rttr.addFlashAttribute("id",t_id);
		rttr.addFlashAttribute("category",svo.getS_category());
		service.insertSche(svo);
		}catch(Exception e){
			e.printStackTrace();
		}
			return "redirect:ScheMain?t_id="+svo.getT_id();
	}
	
	
	@RequestMapping(value = "event", method = {RequestMethod.GET})
	@ResponseBody
	public List<Schedule> events(HttpSession session, Locale locale, Model model,Schedule vo) throws Exception {
		int t_id=(int)session.getAttribute("t_id");	
		
		Contest contest=new Contest();
		
		 

		
		   


	
		List<Schedule> list=service.getEvents(t_id);
		
		model.addAttribute( "calendar", list);

	
		return list;
	}
	@SuppressWarnings("unchecked")
//	@RequestMapping(value = "event")
//	@ResponseBody
//	public ModelAndView events(HttpSession session, Locale locale, RedirectAttributes rttr,ScheVO vo) throws Exception {
//			ModelAndView mav = new ModelAndView();
//
//		     String id=(String)session.getAttribute("u_id");
//		     int t_id=(int)session.getAttribute("t_id");
//		     
//		List<ScheVO> calendar = new ArrayList<ScheVO>();
//		calendar = service.getEvents(t_id);
//		ScheVO scheVO=new ScheVO();
//		scheVO.setT_id(t_id);
//		JSONArray ja = new JSONArray();
//		for (int i = 0; i < calendar.size(); i++) {
//			ScheVO calbean = calendar.get(i);
//			System.out.println(calendar.size());
//              calbean.setT_id(t_id);
//              
//			ja.add(new CalJson(calbean.getS_id(), calbean.getS_title(), calbean.getS_start(), calbean.getS_end(),
//					calbean.getS_color(), calbean.getU_id(),calbean.getT_id(),calbean.getS_category()));
//		}
//System.out.println(ja);
//
//System.out.println("t_id는"+t_id);
//rttr.addFlashAttribute("id", id);
//
//rttr.addFlashAttribute("t_id", t_id);
//mav.addObject("calendar", ja);
//mav.setViewName("Schedule/event");
//		return mav;
//	}
	@RequestMapping(value="/insertSchedule", method=RequestMethod.GET)
	public String insertScheGET(HttpServletRequest request){

		request.setAttribute("start", request.getParameter("s_start"));
		request.setAttribute("end", request.getParameter("s_end"));
	
		
		return "/Schedule/event_addform";
	}
	@RequestMapping(value="/insertScheduleDrop", method=RequestMethod.POST)
	public @ResponseBody String insertScheDropGET(@RequestParam(value="end")String end,
			@RequestParam(value="start")String start, HttpSession session,HttpServletRequest request) throws Exception{

		System.out.println("start는 : " + start);
		System.out.println("start는 : " + end);
		
		String title = request.getParameter("title");

		String id = (String)session.getAttribute("memberId");
		System.out.println("start"+start+", end:"+end);
//		request.setAttribute("start", request.getParameter("start"));
//		request.setAttribute("end", request.getParameter("end"));
		
		Schedule cal = new Schedule();
		cal.setS_title(title);
		cal.setS_content("드랍");
		cal.setS_start(start);
		cal.setS_end(end);
		cal.setS_color("#000000");
		cal.setU_id(id);
		System.out.println("insertScheduleDrop:"+cal);
		
		// 이벤트 목록에서 드레이그해서 넣기 ㅎㅎ
		service.insertScheduleDrop(cal);
		
		return "success";
	}
	@RequestMapping(value="/deleteEvent", method = RequestMethod.GET)
	public String deleteEvent(HttpSession session, Model model,@RequestParam(value="s_no") int s_id) throws Exception {
	
		service.deleteSche(s_id);
		return "redirect:ScheMain";
	}
	
	@RequestMapping(value="/eventUpdate", method = RequestMethod.GET)
	public String eventUpdateGET(Model model, @RequestParam(value="s_no") int no,HttpServletRequest request) throws Exception {

		Schedule view = service.getScheInfo(no);
		model.addAttribute("calendar", view);
	
		
			return "Schedule/eventUpdateForm";
	}
	
	@RequestMapping(value="/eventUpdate", method = RequestMethod.POST)
	public String eventUpdatePOST(Model model, Schedule schevo,@RequestParam(value = "s_start") String start
			, @RequestParam(value = "s_end") String end,RedirectAttributes rttr,HttpSession session) throws Exception {

	     String id=(String)session.getAttribute("u_id");
		start = start.replace('/', '-');
	
		end = end.replace('/', '-');
		schevo.setS_start(start);
		schevo.setS_end(end);
		schevo.setU_id(id);
		System.out.println(schevo.toString());
	
		service.eventUpdate(schevo);
		
		
			return "redirect:ScheMain";
	}
	@RequestMapping(value="/eventDetail")
	public String EventDetail(Model model, @RequestParam(value="s_id") Integer s_id) throws Exception {

		Schedule view = service.getScheInfo(s_id);
		model.addAttribute("calendar", view);
		
		
			return "Schedule/eventDetail";
	}

	@RequestMapping(value="/AllScheList")
	public String AllScheList(HttpSession session, Model model,RedirectAttributes rttr,Schedule vo,@RequestParam("u_id")String u_id) throws Exception {
		 u_id = (String)session.getAttribute("u_id");
		System.out.println(u_id);
		List<Schedule> recentlyList = service.getRecently(u_id);
		System.out.println(Schedule.class.toString());
		rttr.addAttribute("category",vo.getS_category());
	
		model.addAttribute("recentlyList", recentlyList);
	
			return "Schedule/allScheList";
	}
	@RequestMapping(value="/GanttChart", method = RequestMethod.GET)
	@ResponseBody
	public List<Schedule> GanttChart(HttpSession session, Model model) throws Exception {
		int t_id=(int)session.getAttribute("t_id");	
		List<Schedule> list=service.getEvents(t_id);
		model.addAttribute( "calendar", list);

	
		return list;
	}
	@RequestMapping(value="/GanttList", method = RequestMethod.GET)
	public String GanntList() throws Exception {
	
		return"Schedule/GanttChart";
	}	
	
	@RequestMapping(value="/search", method = RequestMethod.GET)
	public void searchGET(HttpSession session, Model model) throws Exception {
	
	}	
	
	@RequestMapping(value="/search", method = RequestMethod.POST)
	public String searchPOST(HttpSession session, Model model, @RequestParam(value="search")String search) throws Exception {
	
		String u_id = (String)session.getAttribute("u_id");
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("m_id", u_id);
		map.put("search", search);
		List<Schedule> getValue = service.getSearchList(map);
		
		model.addAttribute("getValue", getValue);
		
		return "Schedule/scheSearch";
	}	

	@RequestMapping(value="/memberScheduleList", method = RequestMethod.GET)
	public String memberScheduleList(HttpSession session, Model model) throws Exception {
		String id = (String)session.getAttribute("id");
		List<Schedule> recentlyList = service.getRecently(id);
	
		model.addAttribute("recentlyList", recentlyList);
			return "Schedule/memberScheduleList";
	}
	@RequestMapping(value="/TeamScheduleList", method = RequestMethod.GET)
	public String TeamScheduleList(HttpSession session, Model model) throws Exception {
		String id = (String)session.getAttribute("id");
		List<Schedule> recentlyList = service.getRecently(id);
	
		model.addAttribute("recentlyList", recentlyList);
			return "Schedule/TeamScheduleList";
	}
	@RequestMapping(value="/getDelayList", method = RequestMethod.GET)
	public String getDelayList(HttpSession session, Model model) throws Exception {
		String id = (String)session.getAttribute("id");
		List<Schedule> recentlyList = service.getRecently(id);
	
		model.addAttribute("recentlyList", recentlyList);
			return "Schedule/TeamScheduleList";
	}
}

