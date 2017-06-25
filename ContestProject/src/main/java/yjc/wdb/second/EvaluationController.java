package yjc.wdb.second;

import java.awt.Menu;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import yjc.wdb.second.bean.Contest;
import yjc.wdb.second.bean.Evaluation;
import yjc.wdb.second.bean.Manager;
import yjc.wdb.second.bean.TeamVo;
import yjc.wdb.second.service.EvaluationService;
import yjc.wdb.second.service.TeamService;
import yjc.wdb.second.util.MediaUtils;

@Controller
public class EvaluationController {
	private static final Logger logger = LoggerFactory.getLogger(EvaluationController.class);

	@Resource(name="uploadPath")
	private String uploadPath;
	
	@Inject
	private EvaluationService service;
	@Inject
	private TeamService tservice;
	
	@RequestMapping(value = "screen/evalPage", method = RequestMethod.GET)
	public void evalPage(Model model,int t_id) throws Exception {
		
		Manager manage =service.manager(t_id);
		if(manage!=null){
		model.addAttribute("t_id",t_id);
		model.addAttribute("manage",manage);
		Evaluation eval = service.read(manage.getC_id());
	    model.addAttribute("eval",eval);
		}else{
			Evaluation eval = service.read(t_id);
		    model.addAttribute("eval",eval);
		}
	}
	@RequestMapping(value = "screen/elist", method = RequestMethod.GET)
	public void elist(Model model,int t_id,int ep_id) throws Exception {
		model.addAttribute("t_id",t_id);
		model.addAttribute("ep_id",ep_id);
	}
	
	@RequestMapping(value = "screen/ePageModify", method = RequestMethod.GET)
	public void ePageModify(Model model,int t_id) throws Exception {
		Manager manage =service.manager(t_id);
		model.addAttribute("add",t_id);
		List<Manager> m = service.get_epage(manage.getC_id());
		model.addAttribute("getList", m);
	}
	/*@RequestMapping(value = "evalPage2", method = RequestMethod.POST)
	@ResponseBody
   //public String evalPage(@RequestParam Map<String, Object> test ) {
	public String evalPage2( @RequestBody List<MyEP> list ) {
	//public String evalPage( @RequestBody MyEP[] list ) {
		Evaluation eval = null;
		//System.out.println(test);
		System.out.println("evalPage!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
		System.out.println(list.size());
		//System.out.println(list.length);
		/*
		System.out.println("test:"+ test);
		System.out.println(test.get("test"));
         for(int i=0;i<test.size();i++){
        	 System.out.println(test.get(i));
         }
		
        return "evalPage";
    }
	*/
	@RequestMapping(value = "screen/evalPage", method = RequestMethod.POST,
	         produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public ResponseEntity<String> evalPage(@RequestBody Evaluation[] list ) throws Exception {
		System.out.println("ep_how : "+list[0].getEp_how());
		Map<String, Object> map= new HashMap<>();
		
		String how = "";
		for(int i=0;i<list.length;i++){
			if(i==0)
				service.firstCreate(list[i]);
			else
				service.create(list[i]);
			if(list[i].getEp_how().equals("상세채점 방법"))
			how = list[i].getEp_how();
			
		}
		int ep_id = service.ep_id(list[0].getC_id());
	
		map.put("ep_how", how);
		map.put("ep_id", ep_id);
		 ObjectMapper mapper = new ObjectMapper();
		 String json = "";
	        try {
	            json = mapper.writeValueAsString(map);
	        } catch (JsonProcessingException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        }
		
        return new ResponseEntity<>(json, HttpStatus.OK);
    }
	@RequestMapping(value = "screen/elistCreate", method = RequestMethod.POST,
	         produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public ResponseEntity<String> elistCreate(@RequestBody Manager[] list ) throws Exception {
		
		for(int i=0;i<list.length;i++){
			service.elistCreate(list[i]);
		}
		
      return new ResponseEntity<>("�꽦怨�", HttpStatus.OK);
  }
	
	@RequestMapping(value = "screen/ePageModify", method = RequestMethod.POST,
	         produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public ResponseEntity<String> ePageModify(@RequestBody Evaluation[] list ) throws Exception {
		
		for(int i=0;i<list.length;i++){
			service.update(list[i]);
		}
		
       return new ResponseEntity<>("", HttpStatus.OK);
   }
	
	@RequestMapping(value = "screen/manager", method = RequestMethod.GET)
	public String manager(int t_id,Model model,@RequestParam int r_id, HttpSession session) throws Exception {
		List<Manager> m1 = service.epEl(t_id);
		for(int i = 0;i<m1.size();i++)
		m1.get(i).setT_id(t_id);
		model.addAttribute("list",m1);
		//c_id 諛쏄린
		Manager manage =service.manager(t_id);
		model.addAttribute("manage",manage);
		model.addAttribute("t_id",t_id);
		String id=(String)session.getAttribute("u_id");
		manage.setStartNum(r_id);
		boolean b = false;
		int cnt_m = service.cnt_m(t_id);
		int cnt_work = service.cnt_work(m1.get(0));
		int cnt_eval = service.cnt_eval(m1.get(0));
		int total_cnt = cnt_m * cnt_work;
		System.out.println(cnt_work + " " + cnt_eval + " " + total_cnt);
		if(cnt_eval == total_cnt){
			b =true;
		}
		
		manage.setEp_stage(m1.get(0).getEp_stage());
		//�옉�뭹遺덈윭�삤湲�
		Manager work = null;
		 work = service.read_work(manage);
		 work.setU_id(id);
		 work.setT_id(t_id);
		 
			model.addAttribute("work", work);
			Manager get_id = service.get_work_id(work);
			if(get_id != null)
			model.addAttribute("get_id", get_id.getW_id());
			model.addAttribute("b",b);
			model.addAttribute("r_id",r_id);
			Manager m = service.config(t_id);
			model.addAttribute("m",m);
			return "screen/manager";
	}
	
	@RequestMapping(value = "screen/next", method = RequestMethod.GET)
	public String next(int t_id,Model model,@RequestParam int r_id,HttpSession session) throws Exception {
		//�뜝�룞�삕�뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝�떛�벝�삕 李얍뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕
		Manager manage =service.manager(t_id);
		model.addAttribute("manage",manage);
		model.addAttribute("t_id",t_id);
		String id=(String)session.getAttribute("u_id");
		Manager work = null;
		++r_id;
		List<Manager> m1 = service.epEl(t_id);
		for(int i = 0;i<m1.size();i++)
		m1.get(i).setT_id(t_id);
		model.addAttribute("list",m1);
		int cnt = service.cnt_work(m1.get(0));
		if(cnt == r_id)
			--r_id;
		boolean b = false;
		manage.setStartNum(r_id);
		manage.setEp_stage(m1.get(0).getEp_stage());
		 work = service.read_work(manage);
		 work.setU_id(id);
		
			Manager get_id = service.get_work_id(work);
			if(get_id != null)
			model.addAttribute("get_id", get_id.getW_id());
			model.addAttribute("b",b);
			model.addAttribute("work", work);
			model.addAttribute("r_id",r_id);
			Manager m = service.config(t_id);
			model.addAttribute("m",m);
	
			return "screen/manager";
	}
	
	@RequestMapping(value = "screen/pre", method = RequestMethod.GET)
	public String pre(int t_id, Model model, @RequestParam int r_id, HttpSession session) throws Exception {
		// �뜝�룞�삕�뜝�룞�삕�뜝�룞�삕 �뜝�룞�삕�뜝�떛�벝�삕 李얍뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕
		Manager manage = service.manager(t_id);
		model.addAttribute("manage", manage);
		model.addAttribute("t_id", t_id);
		String id = (String) session.getAttribute("u_id");
		boolean b = false;
		Manager work = null;
		if (r_id != 0)
			--r_id;
		List<Manager> m1 = service.epEl(t_id);
		for(int i = 0;i<m1.size();i++)
		m1.get(i).setT_id(t_id);
		model.addAttribute("list",m1);
		manage.setStartNum(r_id);
		manage.setEp_stage(m1.get(0).getEp_stage());
		work = service.read_work(manage);
		work.setU_id(id);
		Manager get_id = service.get_work_id(work);
		model.addAttribute("b",b);
		if (get_id != null)
			model.addAttribute("get_id", get_id.getW_id());
		model.addAttribute("work", work);
		model.addAttribute("r_id", r_id);
		Manager m = service.config(t_id);
		model.addAttribute("m",m);
		return "screen/manager";
	}

	@RequestMapping(value = "screen/team", method = RequestMethod.GET)
	public String team(int t_id,Model model) throws Exception {
		model.addAttribute("t_id",t_id);
		
		Manager manage = service.config(t_id);
		if(manage!=null){
		System.out.println("�뜝��琉꾩삕�뜝�듅�벝�삕�뜝�룞�삕�뜝�룞�삕:"+manage.getEp_how());
		model.addAttribute("manage",manage);
		}
		return "screen/teamMain";
	
	}
	
	@RequestMapping(value = "screen/grande", method = RequestMethod.POST)
	public ResponseEntity<String> grande(@RequestBody Manager m,Model model) throws Exception {
		int score=1;
		m.setE_score(score);
		int t_id = m.getT_id();
		List<Manager> m1 = service.epEl(t_id);
		for(int i = 0;i<m1.size();i++)
		m1.get(i).setT_id(t_id);
		m.setEl_id(m1.get(0).getEl_id());
		System.out.println(m.getGrande());
		if(m.getGrande().equals("pass")){
			score = 100;
			m.setE_score(score);	
		}
		service.grande(m);
		return new ResponseEntity<>("�셿猷�.", HttpStatus.OK);
	
	}
	
	@RequestMapping(value = "screen/del_grande", method = RequestMethod.POST)
	public ResponseEntity<String> del_grande(@RequestBody Manager m,Model model,HttpSession session) throws Exception {
		String id=(String)session.getAttribute("u_id");
		m.setU_id(id);
		service.del_grande(m);
		return new ResponseEntity<>( HttpStatus.OK);
	}
	@RequestMapping(value = "screen/stageModify", method = RequestMethod.GET)
	public ResponseEntity<String> stageModify(int t_id,Model model,HttpSession session) throws Exception {
		String id=(String)session.getAttribute("u_id");
		Manager ep = service.get_ep_id(t_id);
		int m_count = service.cnt_m(t_id);
		ep.setT_id(t_id);
		ep.setM_count(m_count);
		
		List<Manager> m = service.result_get(ep);

		for(int i = 0; i<m.size();i++){
			m.get(i).setStage(ep.getEp_stage()-1);
			System.out.println("�떒怨�:" + m.get(i).getStage());
			service.result_set(m.get(i));
		}
		service.stage_end(t_id);
		service.stage_pro(ep.getEp_id());
		
		return new ResponseEntity<>("", HttpStatus.OK);
	}
	
	@ResponseBody
	@RequestMapping(value="screen/displayFile")
	public ResponseEntity<byte[]> displayFile(String fileName) throws Exception{
		ResponseEntity<byte[]> entity = null;
		
		String ext = fileName.substring(fileName.lastIndexOf(".")+1);
		
		MediaType mediaType = MediaUtils.getMediaType(ext);
		//logger.info("mediaType: " +mediaType);
		InputStream in = null;
		
		//logger.info("File Name: "+ fileName);
		
		HttpHeaders headers = new HttpHeaders();
		try{
			//uploadPath : resources/upload/
			//fileName : /2017/05/18/ThumbNail_rose_xxxxxxxx.jpg
			in = new FileInputStream(uploadPath+ fileName);
			if(mediaType != null){
				headers.setContentType(mediaType);
			}else{
				fileName = fileName.substring(fileName.indexOf("_")+1);
				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
				//�뜝�룞�삕�뜝�떛�냲�삕 �뜝�룞�삕�듃�뜝�룞�삕�뜝�떛�벝�삕�뜝�룞�삕 �뜝�뙣�븘�씛�삕 �뜝�떦�뒗怨ㅼ삕
				String fN = new String(fileName.getBytes("UTF-8"),"ISO-8859-1");
				headers.add("Content-Dispostion", "attachment; filename=\""+ fN+"\"");	
			}
			byte[] data = IOUtils.toByteArray(in);
			entity = new ResponseEntity<byte[]>(data,headers,HttpStatus.CREATED);
			
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		}finally{
			in.close();
		}
		return entity;
	}
	
	@RequestMapping(value = "screen/progress", method = RequestMethod.GET)
	public void eMain(int t_id,Model model,HttpSession session) throws Exception {
		List<Manager> m1 = service.epEl(t_id);
		for(int i = 0;i<m1.size();i++)
		m1.get(i).setT_id(t_id);
		String id=(String)session.getAttribute("u_id");
		int cnt_m = service.cnt_m(t_id);
		int cnt_work = service.cnt_work(m1.get(0));
		int cnt_eval = service.cnt_eval(m1.get(0));
		int total_cnt = cnt_m * cnt_work;
		
		Manager c =service.manager(t_id);
		c.setU_id(id);
		c.setT_id(t_id);
		c.setEl_id(m1.get(0).getEl_id());
		int cnt_u_work = service.cnt_u_work(c);
		List<Manager> list = service.progress(c);
		model.addAttribute("cnt_u_work",cnt_u_work);
		model.addAttribute("cnt_work",cnt_work);
		model.addAttribute("total_cnt",total_cnt);
		model.addAttribute("cnt_eval",cnt_eval);
		model.addAttribute("t_id",t_id);
		model.addAttribute("list",list);
	}
	
	
	
	@RequestMapping(value = "screen/get_stage", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<Map<String,Object>> get_stage(@RequestBody Manager m,Model model) throws Exception {
		ResponseEntity<Map<String,Object>> entity= null;
		//System.out.println("���븘�씠�뵒 : "+m.getT_id());
		//System.out.println("���븘�씠�뵒 : "+t_id);
		
		Manager c = service.manager(m.getT_id());
		List<Manager> ep = service.get_epage(c.getC_id());
		//Map<String, Object> retVal = new HashMap<String, Object>();
		Map<String, Object> map= new HashMap<>();
		
		map.put("list", ep);
		model.addAttribute("list",ep);
		
		entity=new ResponseEntity<Map<String,Object>>(map, HttpStatus.OK);
		return entity;
	}
	@RequestMapping(value = "screen/totalPro", method = RequestMethod.POST)
	@ResponseBody
	public List<Manager> totalPro(@RequestBody Manager m,Model model) throws Exception {
		int t_id = m.getT_id();
		List<Manager> m1 = service.epEl(t_id);
		for(int i = 0;i<m1.size();i++)
		m1.get(i).setT_id(t_id);
		m1.get(0).setT_id(m.getT_id());
		List<Manager> list = service.cnt_alleval(m1.get(0));
		//System.out.println(list.get(1).getAllCnt());
		return list;
	}
	@RequestMapping(value = "screen/eval_result", method = RequestMethod.GET)
	public void eval_result(int t_id,Model model,HttpSession session) throws Exception {
		String id=(String)session.getAttribute("u_id");
		List<Manager> m =service.get_work(t_id);
		model.addAttribute("t_id",t_id);
		model.addAttribute("m",m);
	}
	@RequestMapping(value = "screen/getEp", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<Map<String,Object>> getEp(@RequestBody Manager m,Model model) throws Exception {
		ResponseEntity<Map<String,Object>> entity= null;
		List<Manager> ep = service.epEl(m.getT_id());
		//Map<String, Object> retVal = new HashMap<String, Object>();
		Map<String, Object> map= new HashMap<>();
		
		map.put("list", ep);
		model.addAttribute("list",ep);
		
		entity=new ResponseEntity<Map<String,Object>>(map, HttpStatus.OK);
		return entity;
	}
} 

