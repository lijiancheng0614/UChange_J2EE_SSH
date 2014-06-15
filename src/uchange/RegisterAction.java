package uchange;

import uchange.models.Person;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class RegisterAction extends ActionSupport implements
		ModelDriven<Person> {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Person person = new Person();
	private String password1;

	public String getPassword1() {
		return password1;
	}

	public void setPassword1(String password1) {
		this.password1 = password1;
	}

	public String execute() throws Exception {
		System.out.println("Register: " + person.getStudentId());
		ActionContext.getContext().getSession().put("person", person);
		return SUCCESS;
	}

	public void validate() {
		if (!person.getPassword().equals(password1)) {
			// this.addFieldError("password1.check", "请再次输入相同的密码!");
			this.addActionError("请再次输入相同的密码!");
		}
	}

	@Override
	public Person getModel() {
		return person;
	}

}