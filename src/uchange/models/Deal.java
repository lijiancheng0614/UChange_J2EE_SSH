package uchange.models;

import java.io.Serializable;
import java.sql.Timestamp;

/**
 * provides the base persistence definition of the Deal entity
 * 
 */
public class Deal implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Item item;
	private Person p1;
	private Person p2;
	private Timestamp dealTime;

	public Item getItem() {
		return item;
	}

	public void setItem(Item item) {
		this.item = item;
	}

	public Person getP1() {
		return p1;
	}

	public void setP1(Person p1) {
		this.p1 = p1;
	}

	public Person getP2() {
		return p2;
	}

	public void setP2(Person p2) {
		this.p2 = p2;
	}

	public Timestamp getDealTime() {
		return dealTime;
	}

	public void setDealTime(Timestamp dealTime) {
		this.dealTime = dealTime;
	}

}
