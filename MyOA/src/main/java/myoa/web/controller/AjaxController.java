package myoa.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

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

@RestController
@RequestMapping("/ajax")
public class AjaxController {
	
	@Autowired
	private ActivityActorBiz actorBiz;
	
	@Autowired
	private ActivityBiz activityBiz;
	
	@Autowired
	private EmployeeBiz employeeBiz;
	
	@Autowired
	private DepartmentBiz departmentBiz;
	
	@Autowired
	private AnnouncementBiz announcementBiz;
	
	@RequestMapping("activity")
	public Map<String, Object> LoadActivity(HttpServletRequest request) {
		Map<String, Object> map=new HashMap<>();
		Employee loginUser = (Employee) request.getSession().getAttribute("loginUser");
		List<ActivityActor> alist=actorBiz.getByActorId(loginUser.getId());
		map.put("data", alist);
		return map;
	}
	
	@RequestMapping("fetchActivity")
	public Activity activity(int id) {
		Activity activity=activityBiz.fetchById(id);
		return activity;
	}
	
	@RequestMapping("fetchEname")
	public Map<String, Object> fetchEname(String name,HttpServletRequest request) {
		Map<String, Object> map=new HashMap<>();
		Employee loginUser = (Employee) request.getSession().getAttribute("loginUser");
		List<Department> dlist=departmentBiz.getFullAllByEname(name);
		System.out.println(dlist.size());
		map.put("data", dlist);
		return map;
	}
	
	@RequestMapping("fetchAnnouncementById")
	public Map<String, Object> fetchAnnouncementById(int id) {
		Map<String, Object> map=new HashMap<>();
		Announcement announcement=announcementBiz.fetchById(id);
		map.put("data", announcement);
		return map;
	}
}
