package uchange.models;

import java.io.Serializable;

/**
 * provides the base persistence definition of the Control entity
 * 
 */
public class Control implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int id;
	private int resultSwitch;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getResultSwitch() {
		return resultSwitch;
	}

	public void setResultSwitch(int resultSwitch) {
		this.resultSwitch = resultSwitch;
	}

}
