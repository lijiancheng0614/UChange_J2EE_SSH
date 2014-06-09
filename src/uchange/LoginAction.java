package uchange;

import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String username;
	private String password;

	public String getUsername() {
		return this.username;
	}

	public String getPassword() {
		return this.password;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String execute() throws Exception {
		System.out.print("ok! " + getUsername());
		return SUCCESS;
	}

}
