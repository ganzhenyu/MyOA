package myoa.web.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import myoa.biz.ActivityActorBiz;
import myoa.biz.ActivityBiz;
import myoa.biz.AnnouncementBiz;
import myoa.biz.MessageBiz;
import myoa.biz.MessageReceptionBiz;
import myoa.entity.Employee;

@Controller
@RequestMapping("/pages")
public class MyOAIndexController {
	
	@Autowired
	private ActivityBiz activityBiz;
	
	@Autowired
	private AnnouncementBiz announcementBiz;
	
	@Autowired
	private MessageBiz messageBiz;
	
	@Autowired
	private MessageReceptionBiz messageReceptionBiz;
	
	@RequestMapping(value="/index",method=RequestMethod.GET)
	public String index(HttpSession session,Model model){
		Employee loginUser = (Employee) session.getAttribute("loginUser");
		if (loginUser != null) {
			model.addAttribute("AllMessage",messageBiz.fetchByReceiverId(loginUser.getId(), 5));
			model.addAttribute("NotReadMessage",messageBiz.fetchByIsRead(loginUser.getId(), 5));
			model.addAttribute("LevelMessage",messageBiz.fetchByLevel(loginUser.getId(), 5));
			model.addAttribute("activityToday",activityBiz.getToday(5,loginUser.getId()));
			model.addAttribute("activityFuture",activityBiz.getFutureEndTime(5,loginUser.getId()));
			model.addAttribute("announcements",announcementBiz.getByStatus(5, 2, 0));
			
			model.addAttribute("messagrRe",messageReceptionBiz.findMessageR(0, 0, loginUser.getId()));
		}
		return "pages/index";
	}
}
