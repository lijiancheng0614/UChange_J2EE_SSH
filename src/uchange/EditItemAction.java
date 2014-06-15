package uchange;

import uchange.models.DAO;
import uchange.models.Item;
import uchange.models.Person;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class EditItemAction extends ActionSupport implements ModelDriven<Item> {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Item item = new Item();

	public String execute() throws Exception {
		Person originPerson = (Person) ActionContext.getContext().getSession()
				.get("person");
		DAO dao = new DAO();
		dao.update(originPerson);

		Item originItem = originPerson.getItemOriginal();

		originItem.setName(item.getName());
		originItem.setDescription(item.getDescription());

		dao.save(originItem);

		return SUCCESS;
	}

	@Override
	public Item getModel() {
		return item;
	}

}