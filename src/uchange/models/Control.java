package uchange.models;

import java.io.Serializable;


/**
 * provides the base persistence definition of the Control entity
 * 
 */
public class Control implements Serializable {
    private String resultSwitch;

	public String getResultSwitch() {
		return resultSwitch;
	}

	public void setResultSwitch(String resultSwitch) {
		this.resultSwitch = resultSwitch;
	}
    
    
}
