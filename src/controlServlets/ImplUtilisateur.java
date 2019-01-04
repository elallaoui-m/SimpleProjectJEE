package controlServlets;



import java.util.List;

import javax.management.Query;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.PersistenceContext;



public class ImplUtilisateur implements  DAOUtilisateur{
	
	
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("SimpleProjectJEE"); 
		
		EntityManager em = emf.createEntityManager(); 
		
		//EntityTransaction tx;
	@Override
	public void CreateUtilis(Utilisateur util) {
		em.getTransaction().begin();
		em.persist(util);
		em.getTransaction().commit();
	}

	
	@Override
	public Utilisateur Authentifier(String email,String motdepass) {
		
	javax.persistence.Query query = em.createNativeQuery("select * from utilisateur where email = ? and motdepass = ?",Utilisateur.class);
	query.setParameter(1,email);
	query.setParameter(2,motdepass);
	List<Utilisateur> tab = query.getResultList();
	if(tab.isEmpty() == false) {
		//System.out.println(tab.get(0).getNom());
		return tab.get(0);
	}
	else
		return null;
	
	
	}

	
	@Override
	public void updateUtilis (int id,Utilisateur utilis) {
 
		Utilisateur util = em.find(Utilisateur.class, id);
		em.getTransaction().begin();
		util.setNom(utilis.getNom());
		util.setPrenom(utilis.getPrenom());
		util.setDateN(utilis.getDateN());
		util.setMotdepass(utilis.getMotdepass());
		em.getTransaction().commit();
		
	}

	@Override
	public Utilisateur FindUtilis(int id) {
		 
		return em.find(Utilisateur.class, id);
	}

	@Override
	public void deleteUtilis(int id) {
		
		 em.getTransaction().begin();
		 javax.persistence.Query query2 = em.createNativeQuery("delete from commentaire where id_etudiant = ? ");
		 query2.setParameter(1, id);
		 query2.executeUpdate();
		 em.getTransaction().commit();
		 
		 em.getTransaction().begin();
		 javax.persistence.Query query = em.createNativeQuery("delete from blog where id_etudiant = ? ");
		 query.setParameter(1, id);
		 query.executeUpdate();
		 em.getTransaction().commit();
		 
		Utilisateur utilis = em.find(Utilisateur.class, id);
		em.getTransaction().begin();
		em.remove(utilis);
		em.getTransaction().commit();
		
	}


	@Override
	public List<Utilisateur> ShowAllUsers() {
		
		javax.persistence.Query query = em.createNativeQuery("select * from utilisateur ",Utilisateur.class);
		return query.getResultList();
	}
	
	public Utilisateur searchebyEmail(String email)
	{
		
		javax.persistence.Query query = em.createNativeQuery("select * from utilisateur where email = ?",Utilisateur.class);
		query.setParameter(1,email);
		List<Utilisateur> tab = query.getResultList();
		if(tab.isEmpty() == false) {
			//System.out.println(tab.get(0).getNom());
			return tab.get(0);
		}
		else
			return null;
		
	}
	
	

	
}
