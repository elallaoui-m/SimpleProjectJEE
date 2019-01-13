package controlServlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ActivateAccount
 */
@WebServlet("/ActivateAccount")
public class ActivateAccount extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ActivateAccount() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String idU = request.getParameter("id");
		String token = request.getParameter("token");
		
		ImplUtilisateur impl = new ImplUtilisateur();
		Utilisateur us = impl.FindUtilis(Integer.parseInt(idU));
		if(us.getToken().equals(token))
		{
			us.setVerify("yes");
			us.setToken("");
			impl.updateUtilis(Integer.parseInt(idU), us);
		}
		else if(us.getToken().equals("") || us == null)
			
		{
			
			
		}
		else 
			
		{
			request.setAttribute("verifyError", "true");
			
		}
		
		request.getRequestDispatcher("Login.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
