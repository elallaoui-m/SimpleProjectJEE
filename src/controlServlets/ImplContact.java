package controlServlets;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class ImplContact implements DAOContact {
	
	EntityManagerFactory emf = Persistence.createEntityManagerFactory("SimpleProjectJEE"); 
	EntityManager em = emf.createEntityManager(); 

	@Override
	public void addMsg(Contact ct) {
		
		//Contact ct = new Contact(email,msg,name);
		em.getTransaction().begin();
		em.persist(ct);  
		em.getTransaction().commit();

	}

	@Override
	public boolean deleteMsg(int idMsg) {
		em.getTransaction().begin();
		Contact ct = em.find(Contact.class, idMsg);
		if (ct==null)
			return false;
		em.remove(ct);
		em.getTransaction().commit();
		return true;
	}

}
