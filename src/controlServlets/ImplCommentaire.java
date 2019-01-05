package controlServlets;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;

public class ImplCommentaire implements  DAOComment  {
	
	
	EntityManagerFactory emf = Persistence.createEntityManagerFactory("SimpleProjectJEE"); 
	EntityManager em = emf.createEntityManager(); 
	

	@Override
	public void AddComment(Commentaire comm, Blog b,Utilisateur util) {
		 comm.setUtilisateur(util);
		 comm.setBlog(b);
		em.getTransaction().begin();
		em.persist(comm);  
		em.getTransaction().commit();
		//emf.close();
	}

	@Override
	public void ModifyComment(int id_comm, Commentaire comm) {
		Commentaire comment = em.find(Commentaire.class, id_comm);
		em.getTransaction().begin();
		comment.setComm(comm.getComm());
		em.getTransaction().commit();
	}

	@Override
	public void DeleteComment(int id) {
		em.getTransaction().begin();
		Commentaire comm = em.find(Commentaire.class, id);
		em.remove(comm);
		em.getTransaction().commit();
	}

	@Override //had fonction tatraja3 lik ga3 les commentaires dyal wahd blog 
	public List<Commentaire> GetComments(int id_blog) {
		javax.persistence.Query query = em.createNativeQuery("select * from Commentaire where id_blog = ? order by upvotes desc",Commentaire.class);
		query.setParameter(1, id_blog);
		return query.getResultList();
	}

	@Override //had fonction katraja3 lik hadok les comments li fihom dik lklma (word) had fonction atnf3kom ila drto recherch 
	public List<Commentaire> FindCommnet(String words) {
		javax.persistence.Query query = em.createNativeQuery("select * from Commentaire where comm like ?",Commentaire.class);
		query.setParameter(1, "%"+words+"%");
		return query.getResultList();
	}

	@Override //had fonction fach tgat3iyit 3liha otat3tiha id dyal comment taytzad upvotes dyal dak lcomment (+1)
	public void Upvote(int id_comment) {
		Commentaire comment = em.find(Commentaire.class, id_comment);
		em.getTransaction().begin();
		int up = comment.getUpvotes()+1;
		comment.setUpvotes(up);
		em.getTransaction().commit();
	}
}
