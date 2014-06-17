package uchange;

import java.sql.Timestamp;

import uchange.models.*;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class CommentAction extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String itemID;
	private String content;

	public String execute() throws Exception {
		DAO dao = new DAO();
		Comment comment = new Comment();
		Person person = (Person) ActionContext.getContext().getSession()
				.get("person");
		Item item = dao.findById(Item.class, Integer.parseInt(itemID));
		comment.setItem(item);
		comment.setPerson(person);
		comment.setContent(content);
		comment.setCommentTime(new Timestamp(System.currentTimeMillis()));
		dao.save(comment);
		return SUCCESS;
	}

	public String getItemID() {
		return itemID;
	}

	public void setItemID(String itemID) {
		this.itemID = itemID;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

}
