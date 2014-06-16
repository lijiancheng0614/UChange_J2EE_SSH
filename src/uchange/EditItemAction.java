package uchange;

import uchange.controls.EditControlImpl;
import uchange.models.Item;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class EditItemAction extends ActionSupport implements ModelDriven<Item> {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Item item = new Item();

	public String execute() throws Exception {
		EditControlImpl control = new EditControlImpl();
		control.itemEdit(item);

		return SUCCESS;
	}

	@Override
	public Item getModel() {
		return item;
	}

}