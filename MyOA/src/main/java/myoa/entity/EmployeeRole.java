package myoa.entity;

public class EmployeeRole {
	public EmployeeRole() {}
	


	public EmployeeRole(int id, int employeeId, int roleId) {
		super();
		this.id = id;
		this.employeeId = employeeId;
		this.roleId = roleId;
	}



	private int id;
	private int employeeId;
	private int roleId;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	
	public int getEmployeeId() {
		return employeeId;
	}
	public void setEmployeeId(int employeeId) {
		this.employeeId = employeeId;
	}
	public int getRoleId() {
		return roleId;
	}
	public void setRoleId(int roleId) {
		this.roleId = roleId;
	}
	
}
