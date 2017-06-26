	package yjc.wdb.second;

import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.List;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import yjc.wdb.second.bean.Contest;
import yjc.wdb.second.bean.Criteria;
import yjc.wdb.second.bean.PlaceVo;
import yjc.wdb.second.bean.Receipt;
import yjc.wdb.second.bean.TeamVo;
import yjc.wdb.second.bean.Work;
import yjc.wdb.second.dao.ContestDAO;
import yjc.wdb.second.service.ContestService;
import yjc.wdb.second.service.TeamService;

@Controller
public class ContestController {
	@Inject
	private ContestService service;
	@RequestMapping(value="contestForm", method=RequestMethod.GET)
	public String contestFrom(@ModelAttribute Criteria criteria,Model model,HttpSession session,Contest contest,HttpServletRequest req) {
		 
		  model.addAttribute("t_id", req.getParameter("t_id") );
		 System.out.println(contest.getT_id());
		return "contest/contestForm";
	}
	
	@RequestMapping(value="contestForm", method=RequestMethod.POST)
	public String contstFrom(String c_start, String c_end, Criteria criteria, Contest contest, Model model,HttpSession session,@RequestParam("t_id")Integer t_id) throws Exception{
	
	 System.out.println("d:"+t_id);
		Timestamp ts = Timestamp.valueOf(c_start.replace('T', ' ') + ":00");
		contest.setC_startdate(ts);
		Timestamp te = Timestamp.valueOf(c_end.replace('T', ' ') + ":00");
		contest.setC_enddate(te);
		contest.setT_id(t_id);
		System.out.println(t_id);
		service.create(contest);
		model.addAttribute("criteria", criteria);
		return "redirect:screen/evalPage?t_id="+t_id;
	}
	
	@RequestMapping(value="contestList",method=RequestMethod.GET)
	public String contestList(@RequestParam(value="t_id", defaultValue="0") int t_id, Criteria criteria, Model model,Contest contest, TeamVo teamvo) throws Exception{
		
	  Receipt receipt=new Receipt();
		if(criteria.getCategory() == null){
			criteria.setCategory("allCategory");
		}
		if(criteria.getDateState() == null){
			criteria.setDateState("all");
		}
		if(criteria.getC_searchType() == null || criteria.getC_keyword() == ""){
			criteria.setC_searchType("noSearch");
		}
		System.out.println(criteria.getCategory()+" "+criteria.getDateState()+" "+criteria.getC_searchType());
		
		List<Contest> list = service.listSearch(criteria);
		model.addAttribute("list",list);
		
		int totalCount = service.getSearchTotalCount(criteria);
		
		criteria.setTotalCount(totalCount);	
		model.addAttribute("criteria", criteria);
		model.addAttribute("TeamVo",teamvo);
		criteria.setSubt_id(t_id);
		return "contest/contestList";
	}

	@RequestMapping(value="contestRead", method=RequestMethod.GET)
	public String contestRead(@RequestParam(value="c_id") int c_id, int t_id, @ModelAttribute Criteria criteria, Model model,HttpSession session) throws Exception{
		Contest contest = service.read(c_id);
		model.addAttribute("contest", contest);
		criteria.setSubt_id(t_id);
		
		return "contest/contestRead";
	}

	@RequestMapping(value="getAttachContest/{c_id}")
	@ResponseBody
	public List<String> getAttach(@PathVariable("c_id") int c_id) throws Exception{
		return service.getAttach(c_id);
	}

	@RequestMapping(value="contestRemove")
	public String contestRemove(@RequestParam(value="c_id") int c_id, Criteria criteria, RedirectAttributes rttr) throws Exception{
		service.delete(c_id);
		rttr.addAttribute("category", criteria.getCategory());
		rttr.addAttribute("dateState", criteria.getDateState());
		rttr.addFlashAttribute("delmsg", true);
		return "redirect:contestList";
	}

	@RequestMapping(value="contestModify",method=RequestMethod.GET)
	public String contestModify(@RequestParam(value="c_id") int c_id, Criteria criteria, Model model) throws Exception{
		Contest contest = service.read(c_id);
		model.addAttribute("contest", contest); 
		return "contest/contestModify";
	}

	@RequestMapping(value="contestModify",method=RequestMethod.POST)
	public String contestModify(Contest contest, Criteria criteria, RedirectAttributes rttr) throws Exception{
		service.update(contest);
		rttr.addAttribute("c_id", contest.getC_id());
		rttr.addAttribute("category", criteria.getCategory());
		rttr.addAttribute("dateState", criteria.getDateState());
		return "redirect:contestRead";
	}
	@RequestMapping(value="submit", method=RequestMethod.GET)
	public String submit(Model model,int c_id, int t_id) throws Exception {
	      
		Contest contest=new Contest();
	         contest.setC_id(c_id);
	         contest.setT_id(t_id);
              
	         System.out.println(contest.getC_id());
		 contest = service.read(c_id);
		    
		model.addAttribute("contest", contest);
        System.out.println(contest.getC_id());
		return "contest/contestSubmit";
	}
	@RequestMapping(value="success", method=RequestMethod.GET)
	public String submit() throws Exception {
	    
		return "success";
	}
	@RequestMapping(value="submit", method=RequestMethod.POST)
	public String submit(RedirectAttributes rttr,HttpServletResponse response,Receipt receipt,Work work,@RequestParam("t_id")int t_id,@RequestParam("c_id")int c_id,@ModelAttribute("contest")Contest contest) throws Exception {
		
		

		receipt.setT_id(t_id);  
		System.out.println("공모전 번호는?"+c_id);
        System.out.println("s공모전 번호는?"+contest.getC_id());   		
		System.out.println("vodp 번호는?"+receipt.getC_id());
		  rttr.addFlashAttribute("message", true);  

		
		service.insertSubmit(receipt);
		 
		
		     
		       
              		service.insertwork(work);
              	  System.out.println(work.getW_id());
		return "redirect:contestList";
	}
	
	
	/* 
	@RequestMapping(value="modify",method=RequestMethod.GET)
	public String modify(@RequestParam(value="b_id", defaultValue="-1") int b_id, Criteria criteria, Model model, RedirectAttributes rttr) throws Exception{

		Board board = service.read(b_id);
		model.addAttribute("board", board);
		criteria.setMenuType(board.getBg_id()); 
		rttr.addAttribute("searchType", criteria.getSearchType());
		rttr.addAttribute("keyword", criteria.getKeyword());
		return "modify";
	}
	
	@RequestMapping(value="modifyList",method=RequestMethod.POST)
	public String modifyList(Board board, Criteria criteria, RedirectAttributes rttr) throws Exception{
		service.modify(board);
		rttr.addAttribute("b_id", board.getB_id());
		criteria.setMenuType(board.getBg_id()); 
	    rttr.addAttribute("menuType", criteria.getMenuType());
	    rttr.addAttribute("searchType", criteria.getSearchType());
	    rttr.addAttribute("keyword", criteria.getKeyword());
		return "redirect:read";
		//return "redirect:read?b_id="+board.getb_id();
	}
	o	l
	*/
}
