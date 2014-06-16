package uchange;

import java.util.List;

import uchange.models.*;

import com.opensymphony.xwork2.ActionSupport;

public class AcceptAction extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String itemID;
	private String requestID;

	public String execute() throws Exception {
		DAO dao = new DAO();
		Request request = (Request) dao.findById(Request.class,
				Integer.parseInt(requestID));
		Person person = request.getPerson();
		Item temp = person.getItemNow();
		Item item2 = request.getItem();
		List<Person> allPerson = dao.findAll(Person.class);
		Person person2 = null;
		for (Person p : allPerson) {
			if (p.getItemNow().getId() == item2.getId()) {
				person2 = p;
				break;
			}
		}
		person.setItemNow(item2);
		person2.setItemNow(temp);
		dao.update(person);
		dao.update(person2);
		dao.delete(request);
		return SUCCESS;
	}

	public String getItemID() {
		return itemID;
	}

	public void setItemID(String itemID) {
		this.itemID = itemID;
	}

	public String getRequestID() {
		return requestID;
	}

	public void setRequestID(String requestID) {
		this.requestID = requestID;
	}

}
