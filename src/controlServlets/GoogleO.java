package controlServlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class GoogleO
 */
@WebServlet("/GoogleO")
public class GoogleO extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GoogleO() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		Utilisateur user = new Utilisateur();
		ImplUtilisateur implUser = new ImplUtilisateur();
		
		String email = request.getParameter("email");
		user = implUser.searchebyEmail(email);
		
		if(!user.equals(null))
		{
			return;
		}
		
		
		String name = request.getParameter("name");
		String faname = request.getParameter("faname");
		String id = request.getParameter("id");
		
		user.setEmail(email);
		user.setPrenom(name);
		user.setNom(faname);
		user.setMotdepass(id);
		user.setType("user");
		user.setVerify("yes");
		
		
		implUser.CreateUtilis(user);
		
		response.getWriter().println("done");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
