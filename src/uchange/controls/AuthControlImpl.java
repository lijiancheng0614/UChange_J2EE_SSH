package uchange.controls;

import java.util.List;

import com.opensymphony.xwork2.ActionContext;

import uchange.models.DAO;
import uchange.models.Item;
import uchange.models.Person;

public class AuthControlImpl implements AuthControl {

	@Override
	public void userRegister(Person person, Item item) {

		System.out.println("Init item: " + person.getStudentId() + " "
				+ item.getName());
		
		DAO itemDAO = new DAO();
		itemDAO.save(item);
		
		person.setItemOriginal(item);
		person.setItemNow(item);
		DAO personDAO = new DAO();
		personDAO.save(person);
	}
	
	@Override
	public boolean userLogin(Person person) {
		
		System.out.println("Login: " + person.getStudentId());
		DAO personDAO = new DAO();
		List<Person> l = personDAO.findByProperty(Person.class, "studentId",
				person.getStudentId());
		if (l.size() == 0) {
			return false;
		}
		Person p = l.get(0);
		//personDAO.update(p);
		if (!person.getPassword().equals(p.getPassword())) {
			return false;
		}
		person = p;
		ActionContext.getContext().getSession().put("person", person);
		return true;
	}

}
