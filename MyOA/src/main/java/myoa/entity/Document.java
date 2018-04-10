package myoa.entity;

import java.util.Date;

public class Document {
	public Document() {}	
	public Document(int id, String name, String description, Date createTime, String type, String fileUrl, int parentId,
			Employee employee) {
		super();
		this.id = id;
		this.name = name;
		this.description = description;
		this.createTime = createTime;
		this.type = type;
		this.fileUrl = fileUrl;
		this.parentId = parentId;
		this.employee = employee;
	}
	private int id;
	private String name;
	private String description;
	private Date createTime;
	private String type;
	private String fileUrl;
	private int parentId;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getFileUrl() {
		return fileUrl;
	}
	public void setFileUrl(String fileUrl) {
		this.fileUrl = fileUrl;
	}
	public int getParentId() {
		return parentId;
	}
	public void setParentId(int parentId) {
		this.parentId = parentId;
	}
	
}
