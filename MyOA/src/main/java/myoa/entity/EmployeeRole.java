package myoa.entity;

public class EmployeeRole {
	public EmployeeRole() {}
	
	public EmployeeRole(int id, int employeeId, Role role) {
		super();
		this.id = id;
		this.employeeId = employeeId;
		this.role = role;
	}

	private int id;
	private int employeeId;
	private Role role;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public Role getRole() {
		return role;
	}
	public void setRole(Role role) {
		this.role = role;
	}
	public int getEmployeeId() {
		return employeeId;
	}
	public void setEmployeeId(int employeeId) {
		this.employeeId = employeeId;
	}
	
}
