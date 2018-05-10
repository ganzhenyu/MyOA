package myoa.web.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import myoa.biz.DepartmentBiz;
import myoa.biz.EmployeeBiz;
import myoa.biz.EmployeeRoleBiz;
import myoa.biz.FunctionBiz;
import myoa.biz.RoleBiz;
import myoa.biz.RoleFunctionBiz;
import myoa.dao.RoleDao;
import myoa.entity.Employee;
import myoa.entity.EmployeeRole;
import myoa.entity.Role;
import myoa.entity.RoleFunction;

@Controller
@RequestMapping("/pages")
public class RoleController {
	@Autowired
	private RoleBiz rd;
	@Autowired
	private FunctionBiz fb;
	@Autowired
	private RoleFunctionBiz rb;
	@Autowired
	private EmployeeBiz employeeBiz;
	@Autowired
	private DepartmentBiz departmentBiz;
	@Autowired
	private EmployeeRoleBiz eb;
	

	
	@RequestMapping("/role")
	public String role(Model model) {
		model.addAttribute("role", rd.getAll());
		model.addAttribute("function", fb.getFunctionParent());
		model.addAttribute("functioNot",fb.getFunctionZi());
		return "pages/role";		
	}
	

	@RequestMapping("/addFunction")
	public String addFunction(Model model,int [] checked,Integer id) {
		rb.cancel(id);
		for (int i = 0; i < checked.length; i++) {
			rb.update(id, checked[i]);
		}		
		
		return "redirect:role";		
	}
	
	@RequestMapping("/addEmplpyeeRole")
	public String addEmplpyeeRole(Model model,int [] checked,Integer id) {
		eb.delete(id);
		if(checked==null) {
			return "redirect:roleManage";		
		}
		List<Integer> it =new ArrayList<>();
		List<EmployeeRole> er=eb.getRoleId(id);
		for (int i = 0; i < checked.length; i++) {
			it.add(checked[i]);
		}			
		for (EmployeeRole r : er) {
			it.add(r.getRoleId());
		}
		HashSet h = new HashSet(it);   
		it.clear();   
		it.addAll(h); 
		System.out.println(id);
		for (int i : it) {
			EmployeeRole emr=new EmployeeRole(0, id, i);
			eb.add(emr);
		}
	
		return "redirect:roleManage";		
	}
	@ResponseBody
	@RequestMapping("/deleteRole")
	public Map<String,Object> deleteRole(Integer id) {
		Map<String,Object> model = new HashMap<>();	
		try {
			rb.cancel(id);
			rd.delete(id);
			model.put("ok", true);
		} catch (Exception e) {
			// TODO: handle exception
			model.put("ok", false);
		}
		
		return 	model;
	}
	
	@RequestMapping("/updateRole")
	public String updateRole(Integer id,String name) {
		if(id!=null) {
			Role role=new Role(id, name);
			rd.update(role);
		}else {
			rd.add(name);
		}
		return "redirect:role";		
	}
	
	@ResponseBody
	@RequestMapping("/roleFunction")
	public String roleFunction(int id){	
		List<RoleFunction> rf=rb.FechID(id);
		List<Integer> it =new ArrayList<>();
		for (RoleFunction r : rf) {
			it.add(r.getFunctionId());
		}
		ObjectMapper mapper = new ObjectMapper();  
		String json="";
		try {
			json = mapper.writeValueAsString(it);			
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 		
		return json;
	}
	
	@RequestMapping(value="/roleManage",method=RequestMethod.GET)
	public String employeeRetrieve(Model model) {
		model.addAttribute("employees",employeeBiz.getAll());
		model.addAttribute("departments",departmentBiz.getAll());
		model.addAttribute("role",rd.getAll());
		return "pages/roleManage";
	}
	
	@RequestMapping(value="/roleManage",method=RequestMethod.POST)
	public String employeeRetrieve(Model model,Employee employee) {
		model.addAttribute("role",rd.getAll());
		model.addAttribute("employee",employee);
		model.addAttribute("employees",employeeBiz.fetchEmployees(employee.getNr(), employee.getName(), employee.getDepartment().getId(), employee.getGender()));
		model.addAttribute("departments",departmentBiz.getAll());
		return "pages/roleManage";
	}
	
	
	@ResponseBody
	@RequestMapping("/roleMag")
	public String roleMag(int id){	
		List<EmployeeRole> rf=eb.getRoleId(id);
		List<Integer> it =new ArrayList<>();
		for (EmployeeRole r : rf) {
			it.add(r.getRoleId());
		}
		ObjectMapper mapper = new ObjectMapper();  
		String json="";
		try {
			json = mapper.writeValueAsString(it);			
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 		
		return json;
	}
}
