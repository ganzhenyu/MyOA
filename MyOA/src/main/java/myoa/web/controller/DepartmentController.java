package myoa.web.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import myoa.biz.DepartmentBiz;
import myoa.entity.Department;

@Controller
@RequestMapping("/pages")
public class DepartmentController {
	
	@Autowired
	private DepartmentBiz departmentBiz;
	
	@RequestMapping("/announcement")
	public String announcement(){
		return "pages/announcement";
	}
	
	@RequestMapping(value="/departmentIndex",method=RequestMethod.GET)
	public String DepartmentIndex(Model model) {
		model.addAttribute("departments",departmentBiz.getAll());
		return "pages/departmentIndex";
	}
	
	@RequestMapping(value="/departmentModify",method=RequestMethod.GET)
	public String DepartmentModify(Integer id,Model model) {
		model.addAttribute("department",departmentBiz.fetchById(id));
		return "pages/departmentModify";
	}
	
	@RequestMapping(value="/departmentModify",method=RequestMethod.POST)
	public String DepartmentModify(Department department,Model model) {
		if (department.getId() > 0) {
			departmentBiz.update(department);
			return "redirect:/pages/departmentIndex";
		}else{
			int isusing = departmentBiz.checkNameIsUsing(department.getName());
			if(isusing == 0) {
				departmentBiz.add(department);
				return "redirect:/pages/departmentIndex";
			}else {
				model.addAttribute("AddError", "此部门名称已被使用");
				return "pages/departmentModify";
			}
		}
	}
	
	@RequestMapping("/departmentDelete")
	public String DepartmentDelete(Integer id,HttpSession session) {
		int isusing = departmentBiz.checkIsUsing(id);
		if (isusing == 0) {
			departmentBiz.delete(id);
		}else {
			session.setAttribute("DeleteError", "此部门已被使用，删除失败");
		}
		return "redirect:/pages/departmentIndex";
	}
}
