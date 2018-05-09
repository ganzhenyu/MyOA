package myoa.web.controller;

import java.util.List;
import java.util.ArrayList;
import java.util.HashSet;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import myoa.biz.DepartmentBiz;
import myoa.biz.EmployeeBiz;
import myoa.entity.Employee;
import myoa.entity.EmployeeRole;
import myoa.entity.RoleFunction;
import myoa.biz.EmployeeRoleBiz;
import myoa.biz.RoleFunctionBiz;
@Controller
@RequestMapping("/pages")
public class EmployeeController {
	@Autowired
	private RoleFunctionBiz rb;
	@Autowired
	private EmployeeRoleBiz eb;
	
	@Autowired
	private EmployeeBiz employeeBiz;
	@Autowired
	private DepartmentBiz departmentBiz;
	
	@RequestMapping(value="/userLogin",method=RequestMethod.GET)
	public String Loginindex(){
		return "pages/userLogin";
	}
	
	@RequestMapping(value="/userLogin",method=RequestMethod.POST)
	public String checkLogin(String nr,String password,HttpSession Session,Model model) {
		Employee employee = employeeBiz.checkUserLogin(nr, password);
		if(employee != null) {
			if (employee.getStatus() != 1) {
				model.addAttribute("error","此用户已被注销或停职");
				return "pages/userLogin";
			}else {
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
			}
		}else {
			model.addAttribute("error","用户名或密码有误");
			return "pages/userLogin";
		}
	}
	
	@RequestMapping("/out")
	public String outUser(HttpSession session) {
		session.invalidate();
		return "redirect:/pages/userLogin";
	}
	
	@RequestMapping(value="/employeeModify",method=RequestMethod.GET)
	public String employeeModify(Model model,Integer id) {
		model.addAttribute("departments",departmentBiz.getAll());
		if (id != null) {
			model.addAttribute("employee",employeeBiz.fetchById(id));
		}
		return "pages/employeeModify";
	}
	
	@RequestMapping(value="/employeeModify",method=RequestMethod.POST)
	public String employeeModify(Employee employee) {
		if(employee.getId() > 0) {
			employeeBiz.update(employee);
			return "redirect:/pages/employeeRetrieve";
		}else {
			String nr = "Nr00";
			List<Employee> employees = employeeBiz.getAll();
			int lastId = employees.get(employees.size()-1).getId();
			int newId = lastId + 1;
			employee.setNr(nr+=newId);
			employee.setStatus(1);
			employee.setIsManager(0);
			employeeBiz.add(employee);
			return "redirect:/pages/employeeRetrieve";
		}
	}
	
	@RequestMapping(value="/employeeRetrieve",method=RequestMethod.GET)
	public String employeeRetrieve(Model model) {
		model.addAttribute("employees",employeeBiz.getAll());
		model.addAttribute("departments",departmentBiz.getAll());
		return "pages/employeeRetrieve";
	}
	
	@RequestMapping(value="/employeeRetrieve",method=RequestMethod.POST)
	public String employeeRetrieve(Model model,Employee employee) {
		model.addAttribute("employee",employee);
		model.addAttribute("employees",employeeBiz.fetchEmployees(employee.getNr(), employee.getName(), employee.getDepartment().getId(), employee.getGender()));
		model.addAttribute("departments",departmentBiz.getAll());
		return "pages/employeeRetrieve";
	}
}
