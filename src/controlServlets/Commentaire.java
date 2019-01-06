package controlServlets;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the commentaire database table.
 * 
 */
@Entity
@NamedQuery(name="Commentaire.findAll", query="SELECT c FROM Commentaire c")
public class Commentaire implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="id_commentaire")
	private int idCommentaire;

	private String comm;

	@Column(name="date_comm")
	private String dateComm;

	private int upvotes;

	@ManyToOne
	@JoinColumn(name="id_blog")
	private Blog  blog;

	//bi-directional many-to-one association to Utilisateur
	@ManyToOne
	@JoinColumn(name="id_etudiant")
	private Utilisateur utilisateur;

	public Commentaire() {
	}
	
	public void ShowComment() {
		System.out.println(this.comm);
	}
	
	public Commentaire(String comm, String date, int upvotes/*, int id_blog, int id_use*/) {
		this.comm=comm;
		this.dateComm=date;
		this.upvotes=upvotes;
		/*this.blog = id_blog;
		this.utilisateur = id_user;*/
	}

	public int getIdCommentaire() {
		return this.idCommentaire;
	}

	public void setIdCommentaire(int idCommentaire) {
		this.idCommentaire = idCommentaire;
	}

	public String getComm() {
		return this.comm;
	}

	public void setComm(String comm) {
		this.comm = comm;
	}

	public String getDateComm() {
		return this.dateComm;
	}

	public void setDateComm(String dateComm) {
		this.dateComm = dateComm;
	}

	public int getUpvotes() {
		return this.upvotes;
	}

	public void setUpvotes(int upvotes) {
		this.upvotes = upvotes;
	}

	public Blog getBlog() {
		return this.blog;
	}

	public void setBlog(Blog blog) {
		this.blog = blog;
	}

	public Utilisateur getUtilisateur() {
		return this.utilisateur;
	}

	public void setUtilisateur(Utilisateur utilisateur) {
		this.utilisateur = utilisateur;
	}

	@Override
	public String toString() {
		return "Commentaire [idCommentaire=" + idCommentaire + ", comm=" + comm + ", dateComm=" + dateComm
				+ ", upvotes=" + upvotes + ", blog=" + blog + ", utilisateur=" + utilisateur + "]";
	}

	public Commentaire(int idCommentaire, String comm, int upvotes, String dateComm, Blog blog,
			Utilisateur utilisateur) {
		super();
		this.idCommentaire = idCommentaire;
		this.comm = comm;
		this.dateComm = dateComm;
		this.upvotes = upvotes;
		this.blog = blog;
		this.utilisateur = utilisateur;
	}
	
	
	

}