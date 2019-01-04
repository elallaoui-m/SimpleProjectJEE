package controlServlets;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the utilisateur database table.
 * 
 */
@Entity
@NamedQuery(name="Utilisateur.findAll", query="SELECT u FROM Utilisateur u")
public class Utilisateur implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="id_etudiant")
	private int idEtudiant;

	@Column(name="date_n")
	private String dateN;

	private String email;

	private String nom;

	private String prenom;

	private String type;

	private String verify;
	
	private String motdepass;

	public Utilisateur() {
	}

	public Utilisateur(String dateN,String email,String nom,String prenom,
			String type,String verify,String motdepass) 
	{
	this.dateN = dateN;this.email = email;this.nom = nom;this.prenom = prenom;
	this.type = type;this.verify = verify;this.motdepass = motdepass;
	}

	public int getIdEtudiant() {
		return this.idEtudiant;
	}

	public void setIdEtudiant(int idEtudiant) {
		this.idEtudiant = idEtudiant;
	}

	public String getDateN() {
		return this.dateN;
	}

	public void setDateN(String dateN) {
		this.dateN = dateN;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getNom() {
		return this.nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	public String getPrenom() {
		return this.prenom;
	}

	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}

	public String getType() {
		return this.type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getVerify() {
		return this.verify;
	}

	public void setVerify(String verify) {
		this.verify = verify;
	}
	
	public String getMotdepass() {
		return this.motdepass;
	}

	public void setMotdepass(String motdepass) {
		this.motdepass = motdepass;
	}

}