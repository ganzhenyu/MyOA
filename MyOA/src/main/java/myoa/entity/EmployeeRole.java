package myoa.entity;

public class EmployeeRole {
	public EmployeeRole() {}
	public EmployeeRole(int id, Employee employee, Role role) {
		super();
		this.id = id;
		this.employee = employee;
		this.role = role;
	}
	private int id;
	private Employee employee;
	private Role role;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Employee getEmployee() {
		return employee;
	}
	public void setEmployee(Employee employee) {
		this.employee = employee;
	}
	public Role getRole() {
		return role;
	}
	public void setRole(Role role) {
		this.role = role;
	}
	
}
