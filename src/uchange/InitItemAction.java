package uchange;

import uchange.models.Person;
import uchange.models.Item;
import uchange.models.DAO;

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
		DAO itemDAO = new DAO();
		itemDAO.save(item);

		person = (Person) ActionContext.getContext().getSession().get("person");

		System.out.println("Init item: " + person.getStudentId() + " "
				+ item.getName());

		person.setItemOriginal(item);
		person.setItemNow(item);
		DAO personDAO = new DAO();
		personDAO.save(person);
		return SUCCESS;
	}

	public void validate() {
		System.out.println("Init item: " + item.getName() + " "
				+ item.getDescription());
		if (item.getName() == null || item.getName().equals("")) {
			this.addActionError("请输入物品名称!");
		}
	}

	@Override
	public Item getModel() {
		return item;
	}

}