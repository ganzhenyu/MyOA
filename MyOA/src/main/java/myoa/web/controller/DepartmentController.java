package myoa.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/pages")
public class DepartmentController {
	
	@RequestMapping("/index")
	public String modify(){
		return "pages/index";
	}
	
	@RequestMapping("/announcement")
	public String announcement(){
		return "pages/announcement";
	}
}
