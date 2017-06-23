package yjc.wdb.second;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.Calendar;
import java.util.List;


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
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import yjc.wdb.second.bean.Criteria;
import yjc.wdb.second.bean.PlaceVo;

import yjc.wdb.second.bean.Reservation;
import yjc.wdb.second.bean.evaluationVo;
import yjc.wdb.second.bean.Userbean;
import yjc.wdb.second.bean.pay;
import yjc.wdb.second.dao.PlaceDao;
import yjc.wdb.second.service.PlaceService;


@Controller
@SessionAttributes("u_id")


public class PlaceController {
	private static final Logger logger = LoggerFactory.getLogger(PlaceController.class);
	
	@Inject
	PlaceService service;
	PlaceDao dao;

	@RequestMapping(value = "/place", method = RequestMethod.GET)
	public String place(HttpSession session, Userbean vo) throws Exception {
	String u_id=	(String)session.getAttribute("u_id");
	vo.setU_id(u_id);
		return "place/ShoppingMallAddForm";
	}

	@RequestMapping(value = "/place", method = RequestMethod.POST)
	public String ScheMainPOST(HttpSession session, PlaceVo place,@RequestPart("photo") MultipartFile file, HttpServletRequest req
			) throws Exception {
		if (file.isEmpty() == false) {
			/*
			 * 클라이언트로부터 전달받아서 서버 컴퓨터 어딘가에 저장된 파일을 우리가 원하는 곳(resources/img)에
			 * 복사하자.
			 */
			try {
				System.out.println(place.toString());
				// 1. file 객체로부터 파일 내용의 바이트들을 가져온다.
				byte[] bytes = file.getBytes();

				// 2. bytes 배열을 저장할 파일이 속할 폴더(resources/img) 절대 경로를 구한다.
				String rootPath = req.getSession().getServletContext()
						.getRealPath("./resources/img");

				System.out.println("rootPath:" + rootPath);
				System.out.println(place.toString());
				// 3. rootPath의 폴더가 실제로 존재하는지 검사하고, 존재하지 않으면 그 폴더를 생성한다.
				File folder = new File(rootPath);
				if (folder.exists() == false)
					folder.mkdir();
				System.out.println(place.toString());
				// 4. 서버쪽에 저장될 파일이름은 클라이언트 측에서 전달한 원래의 파일이름과 동일하게 한다.
				String fileName = file.getOriginalFilename();
				String ext = fileName.substring(fileName.length() - 4,
						fileName.length());
				// System.out.println("확장자:" + ext);
				fileName = "" + Calendar.getInstance().getTimeInMillis() + ext;
				// 5. rootPath 밑에 fileName에 해당하는 파일에 전달받은 파일내용(bytes)을
				// 쓰기 위해서 BufferedOutputStream 객체를 생성한다.
				File serverFile = new File(folder.getAbsolutePath() + "/"
						+ fileName);	System.out.println(place.toString());
				BufferedOutputStream stream = null;
				stream = new BufferedOutputStream(new FileOutputStream(
						serverFile));
				stream.write(bytes);
				stream.close();
				System.out.println(place.toString());
				System.out.println("orgFileName:" + file.getOriginalFilename());
				place.setP_picture(fileName);
			    String u_id=(String)session.getAttribute("u_id");
				place.setU_id(u_id);
			    service.insertPlace(place);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		
		}

		return "redirect:PlaceList";
	}

	@RequestMapping(value = "PlaceList", method = RequestMethod.GET)
	public String viewPlace(Model model, HttpServletRequest req, HttpSession session,Criteria2 criteria, RedirectAttributes rttr) throws Exception {
		String u_id=(String )session.getAttribute("u_id");
		List<PlaceVo> result = service.PlaceList(criteria);
		System.out.println(result);
		Userbean user=new Userbean();
		//System.out.println(criteria);
			
				rttr.addAttribute("searchType", criteria.getSearchType());
				rttr.addAttribute("keyword", criteria.getKeyword());
				//List<Board> list = service.listPage(criteria);
			
	
				
	
				int totalCount = service.getTotalCount();
				
				//System.out.println(totalCount);
				//System.out.println(criteria.getPage());
				model.addAttribute("criteria", criteria);
			
				criteria.setTotalCount(totalCount);
		model.addAttribute("placeList", result);
		return "/place/ShoppingMallList";
	}

	@RequestMapping(value = "viewPlace", method = RequestMethod.GET)
	public String viewPlace(Model model, HttpServletRequest req, HttpSession session, Integer p_id) throws Exception {

		PlaceVo p = service.getPlaceInfo(p_id);

		// return "redirect:viewMember";

      
		
		model.addAttribute("placeInfo", p);

		return "/place/ShoppingMallDetail";
	}

	@RequestMapping(value = "reservationForm", method = RequestMethod.GET)
	public String reservation(HttpSession session, PlaceVo vo, Model model, int p_id) {

		PlaceVo p = service.getPlaceInfo(p_id);
		model.addAttribute("a", p);

		return "/place/ReservationAddForm";
	}

	@RequestMapping(value = "reservationForm", method = RequestMethod.POST)

	public String reservationPost(Reservation res, HttpSession session)
			throws Exception {

		try{
		   String	u_id =(String)session.getAttribute("u_id");
		 
			System.out.println(u_id);
			System.out.println(u_id);
			res.setU_id(u_id);
			System.out.println(u_id);
			System.out.println(res.toString());
			service.insertReservation(res);
			 System.out.println("찍혀라제발");
			System.out.println(res.toString());


		}catch (Exception e) {
			// TODO: handle exception
		e.printStackTrace();
		}
				return "redirect:reservationList";
	}

	@RequestMapping(value = "reservationList", method = RequestMethod.GET)
	public String reservationList(Model model, HttpServletRequest req, HttpSession session, Reservation res) {
	    String u_id=(String)session.getAttribute("u_id");
		List<Reservation> result = service.ReservationList(u_id);

		res.setU_id(u_id);
		System.out.println(u_id);
		res.setPr_id(res.getPr_id());
		res.setP_id(res.getP_id());
		model.addAttribute("reservation", result);

		return "/place/ReservationList";
	}

	@RequestMapping(value = "payment", method = RequestMethod.GET)
	public String payment(HttpSession session, Model model, Reservation reservation1,
			@RequestParam("pr_id") int pr_id) {
		String id = (String) session.getAttribute("id");
		Reservation reservation = service.getReservationInfo(pr_id);
		reservation.setU_id(id);
		reservation.setPr_id(pr_id);
		System.out.println(pr_id);
		model.addAttribute("reservation", reservation);
		return "/place/PayMentAddForm";
	}

	@RequestMapping(value = "payment", method = RequestMethod.POST)
	public String payment(pay pay,Reservation reservation) {
       
       System.out.println(reservation.getPr_id());
       int pr_id=reservation.getPr_id();
		pay.setPr_id(pr_id);
		service.insertpay(pay);

		return "redirect:reservationList";
	}

	@RequestMapping(value = "payList", method = RequestMethod.GET)
	public String paymentList(pay pay, Model model, HttpServletRequest req, HttpSession session) {
		String id = (String) session.getAttribute("id");
		List<pay> list = service.Paylist(id);

		Userbean member = new Userbean();
		member.setU_id(id);
		model.addAttribute("pay", list);
		return "/place/PayMentList";
	}

	@RequestMapping(value = "/deletePlace", method = RequestMethod.GET)
	public String deleteEvent(HttpSession session, Model model, @RequestParam(value = "p_id") int no) throws Exception {

		service.deletePlace(no);
		return "redirect:PlaceList";
	}

	
	@RequestMapping(value = "reply")
	public String comment(evaluationVo vo, HttpSession session, PlaceVo vo1, RedirectAttributes rttr) throws Exception {
		try {
			String id = (String) session.getAttribute("id");
			int p_no = vo1.getP_id();
			service.getPlaceInfo(p_no);
			vo.setId(id);
			System.out.println(vo.toString());
			System.out.println(vo1.getP_id());
			System.out.println("id" + id);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return "redirect:viewPlace";
	}

}
