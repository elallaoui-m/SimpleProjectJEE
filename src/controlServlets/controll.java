package controlServlets;

import java.io.IOException;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/controll")
public class controll extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public controll() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("SimpleProjectJEE"); 
		
		EntityManager em = emf.createEntityManager(); 
		
		//Utilisateur util = em.find(Utilisateur.class, 4);
		
		/*ImplLikes a = new ImplLikes();
		boolean d = a.WachDrtLikeOlaLa(1, 1, 4);
		
		if(d == false)
			System.out.println("rj3at false ya3ni madarch like");
		if(d == true)
			System.out.println("rj3at true ya3ni dar like");
		else
			System.out.println("kayn 3ndk mochkil f lcode");*/
		
		new ImplLikes().WachDrtLikeOlaLa(1, 1, 4);
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
