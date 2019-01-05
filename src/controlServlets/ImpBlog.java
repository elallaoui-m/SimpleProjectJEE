package controlServlets;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class ImpBlog implements DAOBlog{

	EntityManagerFactory emf = Persistence.createEntityManagerFactory("SimpleProjectJEE"); 
	
	EntityManager em = emf.createEntityManager(); 
	
	@Override
	public void createBlog(Blog blog,Utilisateur util) {
		
		blog.setUtilisateur(util);
		em.getTransaction().begin();
		em.persist(blog);
		em.getTransaction().commit();
	}


	@Override
	public void UpdateBlog(int id, Blog blog) {
		
		Blog b = em.find(Blog.class, id);
		em.getTransaction().begin();
		b.setTitre(blog.getTitre());
		b.setDescription(blog.getDescription());
		b.setDateBlog(blog.getDateBlog());
		
		em.getTransaction().commit();
	}

	@Override
	public void DeleteBlog(int id) {
		
		
		 em.getTransaction().begin();
		 javax.persistence.Query query = em.createNativeQuery("delete from commentaire where id_blog = ? ");
		 query.setParameter(1, id);
		 query.executeUpdate();
		 em.getTransaction().commit();
		
		Blog b = em.find(Blog.class, id);
		em.getTransaction().begin();
		em.remove(b);
		em.getTransaction().commit();
	}

	@Override
	public List<Blog> ShowAllBlog() {	
		javax.persistence.Query query = em.createNativeQuery("select * from Blog ",Blog.class);
		return query.getResultList();
	}


	@Override
	public  Blog FindBlog(int id) {
		
		return em.find(Blog.class, id);
	}
	
	@Override
	public List<Blog> RechercheBlog(String words) {
		javax.persistence.Query query = em.createNativeQuery("select * from Blog where titre like ?",Blog.class);
		query.setParameter(1, "%"+words+"%");
		return query.getResultList();
	}

}
