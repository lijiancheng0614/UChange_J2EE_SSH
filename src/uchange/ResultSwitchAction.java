package uchange;

import java.util.List;

import uchange.models.DAO;
import uchange.models.Control;
import com.opensymphony.xwork2.ActionSupport;

public class ResultSwitchAction extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public String execute() throws Exception {

		DAO dao = new DAO();
		List<Control> l = dao.findAll(Control.class);
		Control control = l.get(0);
		control.setResultSwitch(1 - control.getResultSwitch());
		return SUCCESS;
	}
}
