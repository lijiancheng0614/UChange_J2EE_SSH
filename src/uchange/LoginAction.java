package uchange;

import uchange.controls.AuthControlImpl;
import uchange.models.Person;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class LoginAction extends ActionSupport implements ModelDriven<Person> {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Person person = new Person();

	public String execute() throws Exception {
		if (person.getStudentId().equals("admin")) {
			return "admin";
		}
		return SUCCESS;
	}

	public void validate() {
		if (person.getStudentId().equals("admin")) {
			return;
		}
		AuthControlImpl control = new AuthControlImpl();
		if (!control.userLogin(person)) {
			this.addActionError("Please enter the correct password!");
		}

	}

	@Override
	public Person getModel() {
		return person;
	}

}
