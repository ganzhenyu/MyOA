package myoa.entity;

public class RoleFunction {
	public RoleFunction() {}
	public RoleFunction(int id, Role role, Function function) {
		super();
		this.id = id;
		this.role = role;
		this.function = function;
	}
	private int id;
	private Role role;
	private Function function;
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
	public Function getFunction() {
		return function;
	}
	public void setFunction(Function function) {
		this.function = function;
	}
	
}
