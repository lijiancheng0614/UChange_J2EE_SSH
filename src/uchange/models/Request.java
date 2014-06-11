package uchange.models;

import java.io.Serializable;


/**
 * provides the base persistence definition of the Request entity
 * 
 */
public class Request implements Serializable {
    private Person person;
    private Item item;
    
    
	public Person getPerson() {
		return person;
	}
	public void setPerson(Person person) {
		this.person = person;
	}
	public Item getItem() {
		return item;
	}
	public void setItem(Item item) {
		this.item = item;
	}
    
}
