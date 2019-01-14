package controlServlets;

import java.io.Serializable;
import javax.persistence.*;


@Entity
@NamedQuery(name="Utilisateur.findAll", query="SELECT u FROM Utilisateur u")
public class Utilisateur implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="id_etudiant")
	@SequenceGenerator( name = "mySeq", sequenceName = "MY_SEQ", allocationSize = 1, initialValue = 1 )
	@GeneratedValue(strategy=GenerationType.IDENTITY, generator="mySeq")
	private int idEtudiant;

	@Column(name="date_n")
	private String dateN;

	@Column(name="email")
	private String email;

	@Column(name="nom")
	private String nom;

	@Column(name="prenom")
	private String prenom;

	@Column(name="type")
	private String type;

	@Column(name="verify")
	private String verify;
	
	@Column(name="motdepass")
	private String motdepass;
	
	@Column(name="gender")
	private String gender;
	
	@Column(name="token")
	private String token;

	
	public Utilisateur() {
	}

	public Utilisateur(String dateN,String email,String nom,String prenom,
			String type,String verify,String motdepass, String gender) 
	{
	this.dateN = dateN;this.email = email;this.nom = nom;this.prenom = prenom;
	this.type = type;this.verify = verify;this.motdepass = motdepass;
	this.gender=gender;
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

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	@Override
	public String toString() {
		return "Utilisateur [idEtudiant=" + idEtudiant + ", dateN=" + dateN + ", email=" + email + ", nom=" + nom
				+ ", prenom=" + prenom + ", type=" + type + ", verify=" + verify + ", motdepass=" + motdepass
				+ ", gender=" + gender + "]";
	}

	public String getToken() {
		return token;
	}

	public void setToken(String token) {
		this.token = token;
	}
	
	

}