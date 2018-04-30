package myoa.entity;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import myoa.web.until.ConvertTime;

public class Activity {
	public Activity() {}
	public Activity(int id, Date createTime, String title, String description, String location, Date startTime,
			Date endTime, Employee employee) {
		super();
		this.id = id;
		this.createTime = createTime;
		this.title = title;
		this.description = description;
		this.location = location;
		this.startTime = startTime;
		this.endTime = endTime;
		this.employee = employee;
	}
	private int id;
	private Date createTime;
	private String title;
	private String description;
	private String location;
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm")
	private Date startTime;
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm")
	private Date endTime;
	private Employee employee;
	
	public Employee getEmployee() {
		return employee;
	}
	public void setEmployee(Employee employee) {
		this.employee = employee;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public Date getStartTime() {
		return startTime;
	}
	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}
	public String getStartTimeLong() {
		if(this.startTime==null)
			return null;
		String time=ConvertTime.DateToLongStr(this.startTime);
		return time;
	}
	public String getStartTimeInfo() {
		if(this.startTime==null)
			return null;
		String time=ConvertTime.DateToTimeStr(this.startTime);
		return time;
	}
	public Date getEndTime() {
		return endTime;
	}
	public String getEndTimeInfo() {
		if(this.endTime==null)
			return null;
		String time=ConvertTime.DateToTimeStr(this.endTime);
		return time;
	}
	public String getEndTimeLong() {
		if(this.endTime==null)
			return null;
		String time=ConvertTime.DateToLongStr(this.endTime);
		return time;
	}
	public Date getEndTimeAddOneDay() {
		if(this.endTime==null)
			return null;
		Date time=ConvertTime.getAddDay(this.endTime, 1);
		return time;
	}
	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}
	
}
