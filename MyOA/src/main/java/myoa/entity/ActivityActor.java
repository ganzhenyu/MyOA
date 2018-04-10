package myoa.entity;

public class ActivityActor {
	public ActivityActor() {}
	public ActivityActor(int id, Activity activity, Employee employee) {
		super();
		this.id = id;
		this.activity = activity;
		this.employee = employee;
	}
	private int id;
	private Activity activity;
	private Employee employee;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Activity getActivity() {
		return activity;
	}
	public void setActivity(Activity activity) {
		this.activity = activity;
	}
	public Employee getEmployee() {
		return employee;
	}
	public void setEmployee(Employee employee) {
		this.employee = employee;
	}
	
}
