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
		return SUCCESS;
	}

	public void validate() {
		
		AuthControlImpl control = new AuthControlImpl();
		if (!control.userLogin(person)) {
			this.addActionError("请输入正确的用户名和密码!");
		}
		
	}

	@Override
	public Person getModel() {
		return person;
	}

}
