package uchange;

import uchange.models.DAO;
import uchange.models.Person;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class EditProfileAction extends ActionSupport implements
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
		Person originPerson = (Person) ActionContext.getContext().getSession()
				.get("person");
		DAO personDAO = new DAO();
		personDAO.update(originPerson);

		originPerson.setFirstName(person.getFirstName());
		originPerson.setLastName(person.getLastName());
		originPerson.setEmail(person.getEmail());
		if (!person.getPassword().equals(""))
			originPerson.setPassword(person.getPassword());

		personDAO.save(originPerson);

		return SUCCESS;
	}

	public void validate() {
		if ((person.getPassword() == null && password1 != null)
				|| (person.getPassword() != null && password1 == null)
				|| (person.getPassword() != null && password1 != null && !person
						.getPassword().equals(password1))) {
			// this.addFieldError("password1.check", "Please enter the same password!");
			this.addActionError("Please enter the same password!");
		}
	}

	@Override
	public Person getModel() {
		return person;
	}

}