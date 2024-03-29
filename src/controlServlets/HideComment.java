package controlServlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class HideComment
 */
@WebServlet("/HideComment")
public class HideComment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HideComment() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void dePost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Utilisateur us = (Utilisateur) request.getSession().getAttribute("Myuser");
		if(us == null || us.getEmail()==null)
		{
			response.sendRedirect("error.jsp");
			System.out.println("error");
		}
		else
		{
			String s = request.getParameter("idcomment");
		ImplCommentaire imC =  new ImplCommentaire();
		imC.DeleteComment(Integer.parseInt(s));
		//System.out.println("hide"+request.getParameter("idblog"));
		request.getRequestDispatcher("/InvocBlogS?idblog="+request.getParameter("idblog")).forward(request, response);
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
