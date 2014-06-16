package uchange;

import uchange.models.*;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class SendAction extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String itemID;

	public String execute() throws Exception {
		DAO dao = new DAO();
		Request request = new Request();
		Person person = (Person) ActionContext.getContext().getSession()
				.get("person");
		Item item = dao.findById(Item.class, Integer.parseInt(itemID));
		request.setItem(item);
		request.setPerson(person);
		dao.save(request);
		return SUCCESS;
	}

	public String getItemID() {
		return itemID;
	}

	public void setItemID(String itemID) {
		this.itemID = itemID;
	}

}
