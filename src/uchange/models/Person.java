package uchange.models;



/**
 * provides the base persistence definition of the Person entity
 * 
 */
public class Person implements java.io.Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int id;
	private String studentId;
	private String password;
	private String firstName;
	private String lastName;
	private String email;
	private Item itemNow;
	private Item itemOriginal;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getStudentId() {
		return studentId;
	}

	public void setStudentId(String studentId) {
		this.studentId = studentId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Item getItemNow() {
		return itemNow;
	}

	public void setItemNow(Item itemNow) {
		this.itemNow = itemNow;
	}

	public Item getItemOriginal() {
		return itemOriginal;
	}

	public void setItemOriginal(Item itemOriginal) {
		this.itemOriginal = itemOriginal;
	}

}