package myoa.entity;

public class Employee {
	public Employee() {}

	public Employee(Integer id, String nr, String password, String name, int gender, int isManager, int status,
			Department department) {
		super();
		this.id = id;
		this.nr = nr;
		this.password = password;
		this.name = name;
		this.gender = gender;
		this.isManager = isManager;
		this.status = status;
		this.department = department;
	}

	private Integer id;
	private String nr;
	private String password;
	private String name;
	private int gender;
	private int isManager;
	private int status;
	private Department department;
	public String getGenderInfo(){
		if(this.gender==0) {
			return "女";
		}else {
			return "男";
		}
	}
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getNr() {
		return nr;
	}
	public void setNr(String nr) {
		this.nr = nr;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getGender() {
		return gender;
	}
	public void setGender(int gender) {
		this.gender = gender;
	}
	public int getIsManager() {
		return isManager;
	}
	public void setIsManager(int isManager) {
		this.isManager = isManager;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public Department getDepartment() {
		return department;
	}
	public void setDepartment(Department department) {
		this.department = department;
	}
	
}
