package uchange;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import uchange.models.Person;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class RegisterAction extends ActionSupport implements
		ModelDriven<Person> {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Person person = new Person();

	@SuppressWarnings("deprecation")
	public String execute() throws Exception {
		System.out.println("Register: " + person.toString());
		System.out.println("StudentID: " + person.getStudentId());
		Configuration cfg = new Configuration().configure();
		SessionFactory factory = cfg.buildSessionFactory();
		Session session = factory.openSession();
		Transaction tx = session.beginTransaction();
		session.save(person);
		tx.commit();
		session.close();
		return SUCCESS;
	}

	@Override
	public Person getModel() {
		return person;
	}

}