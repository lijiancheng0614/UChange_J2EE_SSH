package uchange;

import java.util.List;

import uchange.models.Person;
import uchange.models.Item;
import uchange.models.DAO;

import com.opensymphony.xwork2.ActionContext;
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
		System.out.println("Login: " + person.getStudentId());
		DAO personDAO = new DAO();
		List<Person> l = personDAO.findByProperty(Person.class, "studentId",
				person.getStudentId());
		if (l.size() == 0) {
			this.addActionError("No such user!");
			return;
		}
		Person p = l.get(0);
		//personDAO.update(p);
		if (!person.getPassword().equals(p.getPassword())) {
			this.addActionError("Please enter the correct password!");
		}
		person = p;
		Item item = p.getItemNow();
		ActionContext.getContext().getSession().put("person", person);
	}

	@Override
	public Person getModel() {
		return person;
	}

}
