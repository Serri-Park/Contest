package yjc.wdb.second;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import yjc.wdb.second.bean.IDEA;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	@RequestMapping(value="index",method=RequestMethod.GET)
	public String getindexForm()throws Exception{
		return "index";
		//���Ͻ� �ڵ������� forward��
	}
	@RequestMapping(value="contact",method=RequestMethod.GET)
	public String getcontactForm()throws Exception{
		return "contact";
		//���Ͻ� �ڵ������� forward��
	}
	@RequestMapping(value="gallery",method=RequestMethod.GET)
	public String getgalleryForm()throws Exception{
		return "gallery";
		//���Ͻ� �ڵ������� forward��
	}
	@RequestMapping(value="services",method=RequestMethod.GET)
	public String getservicesForm()throws Exception{
		return "services";
		//���Ͻ� �ڵ������� forward��
	}
	@RequestMapping(value="team",method=RequestMethod.GET)
	public String getteamForm()throws Exception{
		return "team";
		//���Ͻ� �ڵ������� forward��
	}
	@RequestMapping(value="about",method=RequestMethod.GET)
	public String getaboutForm()throws Exception{
		return "about";
		//���Ͻ� �ڵ������� forward��
	}
	
}
