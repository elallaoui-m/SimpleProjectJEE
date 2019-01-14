package controlServlets;

import java.io.Serializable;
import javax.persistence.*;

import java.util.List;


/**
 * The persistent class for the blog database table.
 * 
 */
@Entity
@NamedQuery(name="Blog.findAll", query="SELECT b FROM Blog b")
public class Blog implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="id_blog")
	@SequenceGenerator( name = "mySeq", sequenceName = "MY_SEQ", allocationSize = 1, initialValue = 1 )
	@GeneratedValue(strategy=GenerationType.IDENTITY, generator="mySeq")
	private int idBlog;

	@Column(name="date_blog")
	private String dateBlog;

	@Column(name="description")
	private String description;
	
	@Column(name="intro")
	private String intro;
	
	@Column(name="titre")
	private String titre;

	public String getTitre() {
		return titre;
	}

	public void setTitre(String titre) {
		this.titre = titre;
	}

	//bi-directional many-to-one association to Utilisateur
	@ManyToOne
	@JoinColumn(name="id_etudiant")
	private Utilisateur utilisateur;

	//bi-directional many-to-one association to Commentaire
	@OneToMany(mappedBy="blog")
	private List<Commentaire> commentaires;

	public Blog() {
	}
	
	public Blog(String dateBlog,String description,String titre) {
		this.dateBlog = dateBlog;
		this.description = description;
		this.titre = titre;
	}


	public int getIdBlog() {
		return this.idBlog;
	}

	public void setIdBlog(int idBlog) {
		this.idBlog = idBlog;
	}

	public String getDateBlog() {
		return this.dateBlog;
	}

	public void setDateBlog(String dateBlog) {
		this.dateBlog = dateBlog;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Utilisateur getUtilisateur() {
		return this.utilisateur;
	}

	public void setUtilisateur(Utilisateur utilisateur) {
		this.utilisateur = utilisateur;
	}

	public List<Commentaire> getCommentaires() {
		return this.commentaires;
	}

	public void setCommentaires(List<Commentaire> commentaires) {
		this.commentaires = commentaires;
	}

	public Commentaire addCommentaire(Commentaire commentaire) {
		getCommentaires().add(commentaire);
		commentaire.setBlog(this);

		return commentaire;
	}

	public Commentaire removeCommentaire(Commentaire commentaire) {
		getCommentaires().remove(commentaire);
		commentaire.setBlog(null);

		return commentaire;
	}

	@Override
	public String toString() {
		return "Blog [idBlog=" + idBlog + ", dateBlog=" + dateBlog + ", description=" + description + ", intro=" + intro
				+ ", titre=" + titre + ", utilisateur=" + utilisateur + ", commentaires=" + commentaires + "]";
	}

	public String getIntro() {
		return intro;
	}

	public void setIntro(String intro) {
		this.intro = intro;
	}
	
	

}