package yjc.wdb.second;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.bind.annotation.SessionAttributes;
import yjc.wdb.second.bean.BW;
import yjc.wdb.second.bean.IDEA;
import yjc.wdb.second.bean.Page;
import yjc.wdb.second.service.BWService;


@Controller
public class BWController {
	@Inject
	private BWService service;
		
	@RequestMapping(value="bwlist",method=RequestMethod.GET)
	public String getbwlistForm(String t_id, String u_id,Model model,HttpSession session)throws Exception{
		List<BW> list = service.bwlist(t_id);
		session.setAttribute("t_id", t_id);
		model.addAttribute("list",list);
		return "Teamconference/bwlist";
		//
	}
	
	@RequestMapping(value="idea",method=RequestMethod.GET)
	public String getidealistForm(int bw_id, Model model)throws Exception{
		List<IDEA> list = service.idealist(bw_id);
		model.addAttribute("list",list);
		return "Teamconference/idea";
		//
	}
	
	@RequestMapping(value="bwnav",method=RequestMethod.GET)
	public String getbwnavForm(){
		return "Teamconference/bwnav";
		//
	}
	
	@RequestMapping(value="canvas",method=RequestMethod.GET)
	public String getcanvasForm(){
		return "Teamconference/canvas";
		//
	}
	
	@RequestMapping(value="bwcreate",method=RequestMethod.GET)
	public String getbwcreateForm(String t_id, Model model){
		model.addAttribute("a",t_id);
		return "Teamconference/bwcreate";
		//
	}
	@RequestMapping(value="bwcreate", method=RequestMethod.POST)
	public String bwcreate(BW bw, RedirectAttributes rttr) throws Exception{
		service.bwregist(bw);
		//System.out.println(board.getBW_sub());
		//service.regist1(page);
		
		rttr.addFlashAttribute("result","SUCCESS");
		return "redirect:bwlist?t_id="+bw.getT_id();
	}
	@RequestMapping(value="page",method=RequestMethod.GET)
	public String getPageForm(int bw_id, Model model)throws Exception{
	//	int bwp_id = service.page(bw_id);
		int bw_pagenum =  service.count(bw_id);
		String bw_timer = service.timer(bw_id);
//		System.out.println(bwp_id+"/"+bw_pagenum);
//		model.addAttribute("pageread",bwp_id);
		model.addAttribute("times",bw_timer);
		model.addAttribute("countCk",bw_pagenum);
		model.addAttribute("bw",bw_id);
		return "Teamconference/page";
		//
	}
	@RequestMapping(value="page", method=RequestMethod.POST)
	@ResponseBody
	public String bwpage(int bw_id, RedirectAttributes rttr) throws Exception{
		int bwp_id = service.bwpage(bw_id);
		return "" + bwp_id;
	}
	@RequestMapping(value="ideasub", method=RequestMethod.POST)
	public ResponseEntity<String> ideasub(IDEA idea, RedirectAttributes rttr) throws Exception{
		service.regist2(idea);
		//System.out.println(idea);
		//System.out.println(idea.getIDEA_content());
		rttr.addFlashAttribute("result","SUCCESS");
		return new ResponseEntity<>("", HttpStatus.OK);
	}
	@RequestMapping(value="ideaModify", method=RequestMethod.POST)
	public ResponseEntity<String> ideaModify(IDEA idea) throws Exception{
		service.ideaModify(idea);
		return new ResponseEntity<>("", HttpStatus.OK);
	}
	@RequestMapping(value="bwread", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<Integer> bwread(IDEA idea, RedirectAttributes rttr) throws Exception{
		//System.out.println(IDEA_content);
		int idea_result = service.bwread(idea);
		return new ResponseEntity<>(idea_result,HttpStatus.OK);
	}
	@RequestMapping(value="bwlistpage", method=RequestMethod.POST)
	@ResponseBody
	public String bwlistpage(Page page, RedirectAttributes rttr) throws Exception{
	//	System.out.println(page);
		int pageread = service.listpageid(page);
		return "" + pageread;
	}
	
	@RequestMapping(value="listpage1",method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<Map<String, Object>>  listpage1(Model model,String bwp_id) throws Exception{
		 ResponseEntity<Map<String, Object>> entity = null;
		 try{
			   List<IDEA> list= service.bwlistpage(bwp_id);
			   Map<String, Object> map = new HashMap<String, Object>();
			   map.put("list",list);
			   entity = new ResponseEntity<Map<String, Object>>(map,HttpStatus.OK);
			   
		   }catch(Exception e) {
	         e.printStackTrace();
	         entity = new ResponseEntity<Map<String, Object>> (HttpStatus.BAD_REQUEST);
		   }
//		 System.out.println(entity);
		return entity;
	}

	@RequestMapping(value="category", method=RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String category(String bwc_content, RedirectAttributes rttr) throws Exception{
		//System.out.println(PAGE_id);
		String bwc_contents = service.category(bwc_content);
		return "" + bwc_contents;
	}

	@RequestMapping(value="categoryupdate", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<Integer> categoryupdate(IDEA idea) throws Exception{
		//System.out.println(PAGE_id);
//		String bwi_contents[] = idea.getBwi_content().split("/@");
		
		/*for(int i = 0; i<bwi_contents.length; i++){
			
		}*/
		int a = 1;
		service.categoryupdate(idea);
		
		return new ResponseEntity<>(a,HttpStatus.OK);
	}

}
