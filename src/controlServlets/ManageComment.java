package controlServlets;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddComment
 */
@WebServlet("/AddComment")
public class ManageComment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManageComment() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Utilisateur us = (Utilisateur) request.getSession().getAttribute("Myuser");
		System.out.println(us);
		String cmm = request.getParameter("comment");
		String idb =  request.getParameter("idblog");
		
		Blog b = (new ImpBlog()).FindBlog(Integer.parseInt(idb));
		
		ImplCommentaire ImpC = new ImplCommentaire();
		Commentaire comm = new Commentaire();
		comm.setComm(cmm);
		
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");  
		LocalDateTime now = LocalDateTime.now();  
		comm.setDateComm(dtf.format(now));
		ImpC.AddComment(comm,b , us);
		
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
