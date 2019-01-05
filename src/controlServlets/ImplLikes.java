package controlServlets;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class ImplLikes implements DAOLikes {
	
	EntityManagerFactory emf = Persistence.createEntityManagerFactory("SimpleProjectJEE"); 
	EntityManager em = emf.createEntityManager();

	@Override // bach tzid likes dyal wahd comment f wahd blog
	public void Like(Like lik) {
		em.getTransaction().begin();
		em.persist(lik);
		em.getTransaction().commit();
	}
	
	

	@Override
	public void RemoveLike(int id_blog, int id_comment, int id_etudiant) {
		 em.getTransaction().begin();
		 javax.persistence.Query query = em.createNativeQuery("delete from likes where id_etudiant = ? and id_commentaire = ? and id_blog = ?");
		 query.setParameter(1, id_etudiant);
		 query.setParameter(2, id_comment);
		 query.setParameter(3, id_blog);
		 query.executeUpdate();
		 em.getTransaction().commit();
	}
	
	

	@Override
	public int GetLikesOfAComment(int id_blog, int id_comment) {
		return 0;
	}
	
	

	@Override
	public void WachDrtLikeOlaLa(int id_commentaire, int id_blog, int id_etudiant) {
		
		 em.getTransaction().begin();
		 javax.persistence.Query query = em.createNativeQuery("select count(*) from likes where id_etudiant = 4 and id_commentaire = 1 and id_blog = 1");
//		 query.setParameter(1, id_etudiant);
//		 query.setParameter(2, id_commentaire);
//		 query.setParameter(3, id_blog);
		 //query.executeUpdate();
		 System.out.println(query.getParameterValue(0).toString());
		 em.getTransaction().commit();
		 
		 
		 
		 //System.out.println(n);
		 
		 /*if(n >= 1)
			 return true;
		 else 
			 return false;*/
	}

}
