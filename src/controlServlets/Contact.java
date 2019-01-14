package controlServlets;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the contact database table.
 * 
 */
@Entity
@NamedQuery(name="Contact.findAll", query="SELECT c FROM Contact c")
public class Contact implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="id_msg")
	private int idMsg;

	@Column(name="email")
	private String email;

	@Lob
	private String msg;

	@Column(name="name")
	private String name;

	public Contact() {
	}

	public int getIdMsg() {
		return this.idMsg;
	}

	public void setIdMsg(int idMsg) {
		this.idMsg = idMsg;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMsg() {
		return this.msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "Contact [idMsg=" + idMsg + ", email=" + email + ", msg=" + msg + ", name=" + name + "]";
	}

	public Contact(String email, String msg, String name) {
		super();
		this.email = email;
		this.msg = msg;
		this.name = name;
	}

	
	
}