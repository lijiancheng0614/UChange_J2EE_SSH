package uchange;

import java.sql.Timestamp;
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

		Deal d1 = new Deal();
		d1.setP1(person);
		d1.setP2(person2);
		d1.setItem(person2.getItemNow());
		d1.setDealTime(new Timestamp(System.currentTimeMillis()));
		dao.save(d1);

		Deal d2 = new Deal();
		d2.setP1(person2);
		d2.setP2(person);
		d2.setItem(person.getItemNow());
		d2.setDealTime(d1.getDealTime());
		dao.save(d2);

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
