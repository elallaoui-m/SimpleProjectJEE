package controlServlets;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class ImplLikes implements DAOLikes {
	
	EntityManagerFactory emf = Persistence.createEntityManagerFactory("SimpleProjectJEE"); 
	EntityManager em = emf.createEntityManager();

	@Override // bach tzid likes dyal wahd comment f wahd blog
	public boolean Like(int id_blog, int id_comment, int id_etudiant) {
		
		if (this.WachDrtLikeOlaLa(id_comment, id_blog, id_etudiant) == false){
			Like lk = new Like(id_blog, id_comment, id_etudiant);
			em.getTransaction().begin();
			em.persist(lk);
			em.getTransaction().commit();
			return true; //tzad like dyalo daba
		}
		else
			return false; //howa aslan dar like alor maghadich nzidoh
	}
	
	

	@Override
	public boolean RemoveLike(int id_blog, int id_comment, int id_etudiant) {
		if (this.WachDrtLikeOlaLa(id_comment, id_blog, id_etudiant) == true){
		 em.getTransaction().begin();
		 javax.persistence.Query query = em.createNativeQuery("delete from likes where id_etudiant = ? and id_commentaire = ? and id_blog = ?");
		 query.setParameter(1, id_etudiant);
		 query.setParameter(2, id_comment);
		 query.setParameter(3, id_blog);
		 query.executeUpdate();
		 em.getTransaction().commit();
		return true; //kan dar like daba rah t7ayid
		}
		else
		return false; //aslan howa madarch like
	}
	
	

	@Override //fonction atraja3 lik 3adad likat li kaynin f had lcomment
	public int GetLikesOfAComment(int id_blog, int id_comment) {
		em.getTransaction().begin();
		 javax.persistence.Query query = em.createNativeQuery("select count(*) from likes where id_commentaire = ? and id_blog = ?");
		 query.setParameter(1, id_comment);
		 query.setParameter(2, id_blog);
		 //query.executeUpdate();
		 int a = Integer.parseInt(query.getResultList().get(0).toString());
		 em.getTransaction().commit(); 
		
		return a;
	}
	
	

	@Override //ila bghina n3arfo wach wahd l user dar like l chi comment ola la
	public boolean WachDrtLikeOlaLa(int id_commentaire, int id_blog, int id_etudiant) {
		 em.getTransaction().begin();
		 javax.persistence.Query query = em.createNativeQuery("select count(*) from likes where id_etudiant = ? and id_commentaire = ? and id_blog = ?");
		 query.setParameter(1, id_etudiant);
		 query.setParameter(2, id_commentaire);
		 query.setParameter(3, id_blog);
		 //query.executeUpdate();
		 int a = Integer.parseInt(query.getResultList().get(0).toString());
		 em.getTransaction().commit(); 
		 if(a == 0)
			 return false; //ya3ni had user madarch like
		 else
			 return true; //ya3ni had user dar like
	}

}
