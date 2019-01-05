package controlServlets;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the likes database table.
 * 
 */
@Entity
@Table(name="likes")
@NamedQuery(name="Like.findAll", query="SELECT l FROM Like l")
public class Like implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="id_like")
	private int idLike;

	@Column(name="id_blog")
	private int idBlog;

	@Column(name="id_commentaire")
	private int idCommentaire;

	@Column(name="id_etudiant")
	private int idEtudiant;

	public Like() {
	}

	public int getIdLike() {
		return this.idLike;
	}

	public void setIdLike(int idLike) {
		this.idLike = idLike;
	}

	public int getIdBlog() {
		return this.idBlog;
	}

	public void setIdBlog(int idBlog) {
		this.idBlog = idBlog;
	}

	public int getIdCommentaire() {
		return this.idCommentaire;
	}

	public void setIdCommentaire(int idCommentaire) {
		this.idCommentaire = idCommentaire;
	}

	public int getIdEtudiant() {
		return this.idEtudiant;
	}

	public void setIdEtudiant(int idEtudiant) {
		this.idEtudiant = idEtudiant;
	}

}