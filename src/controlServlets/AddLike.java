package controlServlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddLike
 */
@WebServlet("/AddLike")
public class AddLike extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddLike() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		Utilisateur us = (Utilisateur) request.getSession().getAttribute("Myuser");
		//System.out.println(us);
		String cmm = request.getParameter("comment");
		String idb =  request.getParameter("idblog");
		String idLike = request.getParameter("idLike");
		
		ImplLikes impl = new ImplLikes();
		impl.Like(Integer.parseInt(cmm), Integer.parseInt(idb), Integer.parseInt(idLike));
		
		request.setAttribute("idblog",idb );
		request.getRequestDispatcher("/BlogDetailsS").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
