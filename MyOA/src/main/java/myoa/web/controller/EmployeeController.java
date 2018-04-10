package myoa.web.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import myoa.biz.EmployeeBiz;
import myoa.entity.Employee;

@Controller
@RequestMapping("/pages")
public class EmployeeController {
	
	@Autowired
	private EmployeeBiz employeeBiz;
	
	@RequestMapping(value="/userLogin",method=RequestMethod.GET)
	public String Loginindex(){
		return "pages/userLogin";
	}
	
	@RequestMapping(value="/userLogin",method=RequestMethod.POST)
	public String checkLogin(String nr,String password,HttpSession Session,Model model) {
		Employee employee = employeeBiz.checkUserLogin(nr, password);
		if(employee != null) {
			Session.setAttribute("loginUser", employee);
			return "redirect:/pages/index";
		}else {
			model.addAttribute("error","用户名或密码有误");
			return "pages/userLogin";
		}
	}
}
