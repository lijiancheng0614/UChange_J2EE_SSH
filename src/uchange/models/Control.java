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
	private String resultSwitch;
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getResultSwitch() {
		return resultSwitch;
	}

	public void setResultSwitch(String resultSwitch) {
		this.resultSwitch = resultSwitch;
	}

}
