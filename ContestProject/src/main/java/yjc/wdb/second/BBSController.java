package yjc.wdb.second;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import yjc.wdb.second.bean.Board;
import yjc.wdb.second.bean.Criteria;
import yjc.wdb.second.service.BoardService;

@Controller
public class BBSController {
	@Inject
	private BoardService service;
	
	@RequestMapping(value="create",method=RequestMethod.GET)
	public String getBoardForm(@ModelAttribute Criteria criteria){
		return "Board/boardForm";
		//占쏙옙占싹쏙옙 占쌘듸옙占쏙옙占쏙옙占쏙옙 forward占쏙옙
	}
	@RequestMapping(value="create", method=RequestMethod.POST)
	public String create(Criteria criteria, Board board, RedirectAttributes rttr) throws Exception{
		service.regist(board);
		//rttr.addFlashAttribute("result","SUCCESS");
		rttr.addAttribute("menuType", board.getBg_id());
		return "redirect:listPage";
	}
	
	@RequestMapping(value="listPage",method=RequestMethod.GET)
	public String listPage(Criteria criteria, Model model, RedirectAttributes rttr) throws Exception{
		rttr.addAttribute("menuType", criteria.getMenuType());
		rttr.addAttribute("searchType", criteria.getSearchType());
		rttr.addAttribute("keyword", criteria.getKeyword()); 

		//List<Board> list = service.listPage(criteria);
		List<Board> list = service.listSearch(criteria);
		model.addAttribute("list",list);
		model.addAttribute("criteria", criteria);
		// startPage, endPage, previous, next
		//int totalCount = service.getTotalCount();
		int totalCount = service.getSearchTotalCount(criteria);
		criteria.setTotalCount(totalCount);
		
		return "Board/listPage";
	}

	@RequestMapping(value="read", method=RequestMethod.GET)
	public String read(@RequestParam(value="b_id", defaultValue="-1") int b_id, @ModelAttribute Criteria criteria, Model model) throws Exception{
	  
	  Board board = service.read(b_id);
	  String g_name = service.readGroup(board.getBg_id());
	  board.setBg_name(g_name);;
	  model.addAttribute("board",board);
	  return "Board/read";
	}
	   
	@RequestMapping(value="remove")
	public String remove(@RequestParam(value="b_id",defaultValue="-1") int b_id, Criteria criteria, RedirectAttributes rttr) throws Exception{
		service.remove(b_id);
		//redirect占쏙옙키占쏙옙 model占쏙옙 占쌍어서 占쏙옙占쏙옙占쌀쇽옙占쏙옙占쏙옙占쏙옙
		//return "redirect:listPage?page="+criteria.getPage()+"&recordsPerPage="+criteria.getRecordsPerPage();
		rttr.addAttribute("page", criteria.getPage());
		rttr.addAttribute("recordsPerPage", criteria.getRecordsPerPage());
		rttr.addAttribute("menuType", criteria.getMenuType());
		rttr.addAttribute("searchType", criteria.getSearchType());
		rttr.addAttribute("keyword", criteria.getKeyword());
	      rttr.addFlashAttribute("delmsg", true); //占싼뱄옙占쏙옙
	      return "redirect:listPage";
	}
	
	@RequestMapping(value="modify",method=RequestMethod.GET)
	public String modify(@RequestParam(value="b_id", defaultValue="-1") int b_id, Criteria criteria, Model model, RedirectAttributes rttr) throws Exception{

		Board board = service.read(b_id);
		model.addAttribute("board", board);
		criteria.setMenuType(board.getBg_id()); 
		rttr.addAttribute("searchType", criteria.getSearchType());
		rttr.addAttribute("keyword", criteria.getKeyword());
		return "Board/modify";
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
	
	@RequestMapping(value="listSearch", method=RequestMethod.GET)
	public String listSearch(@ModelAttribute Criteria criteria, Model model) throws Exception{
		List<Board> list = service.listSearch(criteria);
		model.addAttribute("list", list);
		int totalCount = service.getSearchTotalCount(criteria);
		criteria.setTotalCount(totalCount);
		return "Board/listPage";
		
	}
	
	
	@RequestMapping(value="getAttach/{b_id}")
	@ResponseBody
	public List<String> getAttach(@PathVariable("b_id")Integer b_id)throws Exception{
		return service.getAttach(b_id);
	}
	
}
