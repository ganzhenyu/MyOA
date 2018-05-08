package myoa.web.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import myoa.biz.ActivityActorBiz;
import myoa.biz.ActivityBiz;
import myoa.entity.Employee;

@Controller
@RequestMapping("/pages")
public class MyOAIndexController {
	
	@Autowired
	private ActivityBiz activityBiz;
	
	@Autowired
	private ActivityActorBiz activityActorBiz;
	
	@RequestMapping(value="/index",method=RequestMethod.GET)
	public String index(HttpSession session,Model model){
		Employee loginUser = (Employee) session.getAttribute("loginUser");
		if (loginUser.getId() > 0) {
			model.addAttribute("activityActor",activityActorBiz.getByActorId(loginUser.getId()));
			model.addAttribute("activitys",activityBiz.getByEmployeeId(loginUser.getId()));
		}
		return "pages/index";
	}
}
