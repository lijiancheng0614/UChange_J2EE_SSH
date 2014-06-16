package uchange.controls;

import uchange.models.Item;
import uchange.models.Person;

public interface EditControl {

	//item edit
	public abstract void itemEdit(Item item);
	
	//user edit
	public abstract void userEdit(Person person);
	
}
