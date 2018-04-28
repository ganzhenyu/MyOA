package myoa.web.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import myoa.biz.ActivityActorBiz;
import myoa.biz.ActivityBiz;
import myoa.biz.AnnouncementBiz;
import myoa.biz.DepartmentBiz;
import myoa.biz.EmployeeBiz;
import myoa.entity.Activity;
import myoa.entity.ActivityActor;
import myoa.entity.Announcement;
import myoa.entity.Department;
import myoa.entity.Employee;

@Controller
public class IndexController {
	
	@Autowired
	private EmployeeBiz employeeBiz;
	
	@Autowired
	private DepartmentBiz departmentBiz;
	
	@Autowired
	private ActivityBiz activityBiz;
	
	@Autowired
	private ActivityActorBiz activityActorBiz;
	
	@Autowired
	private AnnouncementBiz announcementBiz;
	
	@RequestMapping("/activity")
	public String announcement(Model model,HttpSession session){
		//合成要删除
		Employee loginUser=employeeBiz.checkUserLogin("Nr002", "123");
		session.setAttribute("loginUser", loginUser);
		int did=loginUser.getDepartment().getId();
		List<Employee> elist= employeeBiz.getByDid(did);
		model.addAttribute("elist",elist);
		return "activity";
	}
	
	
	@RequestMapping(value="/checkActivity",method=RequestMethod.POST)
	public String checkActivity(Activity activity,int[] actorId,HttpServletRequest request,Integer did) {
		if(did!=null) {
			activityBiz.detele(did);
			return "redirect:/activity";
		}	
		Employee loginUser = (Employee) request.getSession().getAttribute("loginUser");
		activity.setEmployee(loginUser);
		activity.setCreateTime(new Date(System.currentTimeMillis()));
		if(activity.getId()==0) {
			activityBiz.add(activity);
			ActivityActor actor=new ActivityActor(0, activity, loginUser);
			if(actorId!=null) {
				activityActorBiz.addActorIdList(activity, actorId);
			}else {
				activityActorBiz.add(actor);
			}
		}else {
			activityBiz.update(activity);
		}
		return "redirect:/activity";
	}
	
	@RequestMapping("/meeting")
	public String meeting(Model model,HttpSession session){
		//合成要删除
		Employee loginUser=employeeBiz.checkUserLogin("Nr002", "123");
		session.setAttribute("loginUser", loginUser);
		List<Department> dlist=departmentBiz.getFullAll();
		model.addAttribute("dlist",dlist);
		return "meeting";
	}
	
	@RequestMapping("/ann_add")
	public String addAnnouncement() {
		return "ann_add";
	}
	
	@RequestMapping("/ann_compile")
	public String announcementcompile(Model model,HttpServletRequest request) {
		Employee loginUser = (Employee) request.getSession().getAttribute("loginUser");
		List<Announcement> alist1=announcementBiz.getByStatus(5, 0,loginUser.getId());
		List<Announcement> alist2=announcementBiz.getByStatus(5, 3,loginUser.getId());
		model.addAttribute("alist1",alist1);
		model.addAttribute("alist2",alist2);
		return "ann_compile";
	}
	
	@RequestMapping("/ann_audit")
	public String announcementaudit(Model model,HttpServletRequest request) {
		Employee loginUser = (Employee) request.getSession().getAttribute("loginUser");
		List<Announcement> list=announcementBiz.getByStatus(-1, 1,loginUser.getId());
		model.addAttribute("list",list);
		return "ann_audit";
	}
}
