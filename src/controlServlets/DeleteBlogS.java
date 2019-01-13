package controlServlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DeleteBlogS
 */
@WebServlet("/DeleteBlogS")
public class DeleteBlogS extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ImpBlog impBlog =new ImpBlog();
	Utilisateur user=new Utilisateur();
	Blog b =new Blog();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteBlogS() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Utilisateur us = (Utilisateur) request.getSession().getAttribute("Myuser");
		if(us == null || us.getEmail()==null)
		{
			response.sendRedirect("error.html");
			System.out.println("error");
		}
		else {
			
			//System.out.println(us);
			
			 String idblog = request.getParameter("idB");
			 System.out.println(idblog+"igblog");
			 int idb=Integer.parseInt(idblog);
			 impBlog.DeleteBlog(idb);
			request.getSession().setAttribute("id", us.getIdEtudiant());
			response.sendRedirect("HomePageS");
			//request.getRequestDispatcher("/HomePageS").forward(request, response);
		}
		System.out.println("ok ca marche");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
