package yjc.wdb.second;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import yjc.wdb.second.bean.Userbean;
import yjc.wdb.second.service.memberService;




@Controller

public class memberController {
	
	private static final Logger logger = LoggerFactory
			.getLogger(memberController.class);
	
	
	@Inject
	memberService service;
	@RequestMapping(value="/insertmember", method=RequestMethod.GET)
	public String  join() throws Exception{
				
		return"Member/join";
	}
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String  login() throws Exception{
		
		return"Member/login";
	}
	@Resource(name="uploadPath")
	private String uploadPath;
	@RequestMapping(value = "insertmember", method = RequestMethod.POST)
	public String join(Userbean m,
			@RequestParam("photo") MultipartFile file, HttpServletRequest req,
			HttpSession session) {
		if (file.isEmpty() == false) {
			/*
			 * 클라이언트로부터 전달받아서 서버 컴퓨터 어딘가에 저장된 파일을 우리가 원하는 곳(resources/img)에
			 * 복사하자.
			 */
			try {
				System.out.println(m.toString());
				// 1. file 객체로부터 파일 내용의 바이트들을 가져온다.
				byte[] bytes = file.getBytes();

				// 2. bytes 배열을 저장할 파일이 속할 폴더(resources/img) 절대 경로를 구한다.
			String rootPath = req.getSession().getServletContext()
					.getRealPath("./resources/upload");
	
				System.out.println("rootPath:" + rootPath);
				System.out.println(m.toString());
				// 3. rootPath의 폴더가 실제로 존재하는지 검사하고, 존재하지 않으면 그 폴더를 생성한다.
				File folder = new File(rootPath);
				if (folder.exists() == false)
					folder.mkdir();
				System.out.println(m.toString());
				// 4. 서버쪽에 저장될 파일이름은 클라이언트 측에서 전달한 원래의 파일이름과 동일하게 한다.
				String fileName = file.getOriginalFilename();
				String ext = fileName.substring(fileName.length() - 4,
						fileName.length());
				// System.out.println("확장자:" + ext);
				fileName = "" + Calendar.getInstance().getTimeInMillis() + ext;
				// 5. rootPath 밑에 fileName에 해당하는 파일에 전달받은 파일내용(bytes)을
				// 쓰기 위해서 BufferedOutputStream 객체를 생성한다.
				File serverFile = new File(folder.getAbsolutePath() + "/"
						+ fileName);	System.out.println(m.toString());
				BufferedOutputStream stream = null;
				stream = new BufferedOutputStream(new FileOutputStream(
						serverFile));
				stream.write(bytes);
				stream.close();
				System.out.println(m.toString());
				System.out.println("orgFileName:" + file.getOriginalFilename());
				m.setU_profile(fileName);
				session.setAttribute("id", m.getU_id());
				System.out.println(m.toString());
				  service.insertMember(m);
			} catch (Exception e) {
				e.printStackTrace();
			}

		}

		return "redirect:home";
	}

	@RequestMapping(value="/login")
	public String loginGET(HttpServletRequest request, Userbean vo,HttpSession session,RedirectAttributes rttr,PrintWriter out) throws Exception {
		String URL = "";
		String pw=vo.getU_pass();
		if(service.login(vo)!=null){
			request.getSession().setAttribute("u_id", vo.getU_id());
			rttr.addFlashAttribute("response","success");
	           
			URL ="redirect:/home";

		
		
		}
		
			return URL = "redirect:home"; 	

	}
		
		
		
		
		
			
			
		 
		

		
		
	@RequestMapping(value = "viewMember", method = RequestMethod.GET)
	public String viewMember(Model model, HttpServletRequest req, HttpSession session,String u_id) {
		u_id=(String)session.getAttribute("u_id");
		System.out.println("viewMember1:" + u_id);
        Userbean m=new Userbean();  	
        System.out.println(m.getU_hp());
        System.out.println(m.getU_id());
        System.out.println(m.toString());
 		m.setU_id(u_id); 
        m = service.view(u_id);
        
		// return "redirect:viewMember";
		model.addAttribute("userInfo", m);
		return "/Member/viewMember";
	}
	// 모든 회원의 정보 보기
	@RequestMapping(value = "viewAllMember", method = RequestMethod.GET)
	public String viewAllMember(Model model, HttpServletRequest req, HttpSession session) {
		List<Userbean > result = service.getMemberAll();
		// return "redirect:viewMember";
		model.addAttribute("userInfos", result);
		return "/Member/viewMemberAll";
	}
		
	@RequestMapping(value="/logout")
	public String  loginForm(HttpSession session) throws Exception{
	session.invalidate();
		
		return"redirect:home";
	}	
	@RequestMapping(value="/joinCheck", method = RequestMethod.POST)
	@ResponseBody
	public String joinCheck(@RequestParam("id")String id) throws Exception{
		String str = "";
		if(service.check(id)==null){
			str="true";
		}
		
		return str;
	}
	
}
