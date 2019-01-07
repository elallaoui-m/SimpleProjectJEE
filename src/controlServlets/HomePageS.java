package controlServlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class HomePageS
 */
@WebServlet("/HomePageS")
public class HomePageS extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HomePageS() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Utilisateur us = (Utilisateur) request.getSession(false).getAttribute("Myuser");
		if(us == null || us.getEmail()==null)
		{
			response.sendRedirect("ifError.jsp");
			System.out.println("error");
		}
		else
		{
			ImpBlog impB =  new ImpBlog();
			List<Blog> lst = impB.ShowAllBlog();
			request.setAttribute("lstBlog", lst);
			request.getRequestDispatcher("blogs.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

}
