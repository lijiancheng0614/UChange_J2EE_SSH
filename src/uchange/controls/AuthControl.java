package uchange.controls;

import uchange.models.Item;
import uchange.models.Person;

public interface AuthControl {

	//user register
	public abstract void userRegister(Person person, Item item);
	
	//user login
	public abstract boolean userLogin(Person person);
	
}
