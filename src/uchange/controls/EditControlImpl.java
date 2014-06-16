package uchange.controls;

import com.opensymphony.xwork2.ActionContext;

import uchange.models.DAO;
import uchange.models.Item;
import uchange.models.Person;

public class EditControlImpl implements EditControl {

	@Override
	public void itemEdit(Item item) {
		Person originPerson = (Person) ActionContext.getContext().getSession()
				.get("person");
		DAO dao = new DAO();
		dao.update(originPerson);

		Item originItem = originPerson.getItemOriginal();

		originItem.setName(item.getName());
		originItem.setDescription(item.getDescription());

		dao.save(originItem);
	}

	@Override
	public void userEdit(Person person) {
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
	}

}
