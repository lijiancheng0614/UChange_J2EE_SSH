package uchange;

import uchange.controls.AuthControlImpl;
import uchange.models.Item;
import uchange.models.Person;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class InitItemAction extends ActionSupport implements ModelDriven<Item> {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Person person;
	private Item item = new Item();

	public String execute() throws Exception {
		
		person = (Person) ActionContext.getContext().getSession().get("person");
		
		AuthControlImpl control = new AuthControlImpl();
		control.userRegister(person, item);

		return SUCCESS;
	}

	public void validate() {
		System.out.println("Init item: " + item.getName() + " "
				+ item.getDescription());
		
		if (item.getName() == null || item.getName().equals("")) {
			this.addActionError("Please enter the name!");
		}
	}

	@Override
	public Item getModel() {
		return item;
	}

}