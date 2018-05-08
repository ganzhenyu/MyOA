package myoa.web.controller;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import myoa.biz.EmployeeBiz;
import myoa.biz.EmployeeRoleBiz;
import myoa.biz.RoleFunctionBiz;
import myoa.entity.Employee;
import myoa.entity.EmployeeRole;
import myoa.entity.RoleFunction;

@Controller
@RequestMapping("/pages")
public class EmployeeController {
	@Autowired
	private RoleFunctionBiz rb;
	@Autowired
	private EmployeeRoleBiz eb;
	
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
			List<EmployeeRole> employeeRole=eb.getRoleId(employee.getId());
			List<Integer> in=new ArrayList<>();
			
			for (EmployeeRole e : employeeRole) {
				for (RoleFunction r : rb.FechID(e.getEmployeeId())) {
					in.add(r.getFunctionId());
				}
			}
			
			 HashSet h = new HashSet(in);   
			 in.clear();   
			 in.addAll(h);   
			 Session.setAttribute("roleFunction", in);
			
			 for (int i : in) {
				System.out.println(i);
			}
			 
			return "redirect:/pages/index";
		}else {
			model.addAttribute("error","用户名或密码有误");
			return "pages/userLogin";
		}
	}
}
