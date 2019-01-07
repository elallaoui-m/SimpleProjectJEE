package controlServlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class InvocBlogS
 */
@WebServlet("/InvocBlogS")
public class InvocBlogS extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InvocBlogS() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void dePost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Utilisateur us = (Utilisateur) request.getSession(false).getAttribute("Myuser");
		if(us == null || us.getEmail()==null)
		{
			response.sendRedirect("ifError.jsp");
			System.out.println("error");
		}
		else {
			
			//System.out.println(us);
			String idblog;
			idblog = request.getParameter("idblog");
			request.getSession(false).setAttribute("id", us.getIdEtudiant());
			request.getRequestDispatcher("/BlogDetailsS").forward(request, response);
			System.out.println(idblog+"invoc");
		}
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		dePost(request, response);
	}

}
