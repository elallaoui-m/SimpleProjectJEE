package controlServlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LoginS
 */
@WebServlet("/LoginS")
public class LoginS extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static final String VUE_FORM = "/Login.jsp";
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginS() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    boolean checkInfo(String user, String pass)
    {
    	
    	if(user.equals("admin@ad.com") && pass.equals("admin"))
    		return true;
		return false;
    	
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String pass = request.getParameter("pass");
		String user = request.getParameter("email");
		if(checkInfo(user,pass))
		{
			response.getWriter().append("<a href='"+"Login.jsp?disco=1"+"'>Go Back</a>");
			request.getSession().setAttribute("user", user);
		}
			
		else 
		{
			request.removeAttribute("pass");
			request.removeAttribute("email");
			request.setAttribute("correct", "0");
			request.getRequestDispatcher("Login.jsp").forward(request, response);
		}
			
			
		
		//this.getServletContext().getRequestDispatcher( VUE_FORM ).forward( request, response );
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
