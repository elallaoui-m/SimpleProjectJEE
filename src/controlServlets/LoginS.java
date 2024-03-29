package controlServlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginS
 */
@WebServlet("/LoginS")
public class LoginS extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static final String VUE_FORM = "/Login.jsp";
	
	Utilisateur Us = new Utilisateur();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginS() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    boolean checkInfo(String user, String pass)
    {
    	ImplUtilisateur imp = new ImplUtilisateur();
    	Us = imp.Authentifier(user, pass);
    	if(Us != null)
    	{
    		
    		return true;
    	}
    	
		return false;
    	
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String pass = request.getParameter("pass");
		String user = request.getParameter("email");
		if(checkInfo(user,pass))
		{
			if(Us.getVerify().equals("no"))
			{
				request.getRequestDispatcher("Login.jsp?verify=no").forward(request, response);
				System.out.println("He said no");
				
			}
			
			HttpSession oldSession = request.getSession(false);
            if (oldSession != null) {
                oldSession.invalidate();
            }
            //generate a new session
            request.getSession(true);
			
			request.getSession(false).setAttribute("email", user);
			request.getSession(false).setAttribute("typeUser",Us.getType() );
			//request.setAttribute("user", Us);
			request.getSession(false).setAttribute("Myuser", Us);
			
			request.getRequestDispatcher("/HomePageS").forward(request, response);
			
			
			
			//response.getWriter().append("<a href='"+"Login.jsp?logout=1"+"'>Go Backas</a>");
			/*response.getWriter().append("<a href=\"#\" onclick=\"signOut();\">Sign out</a>\r\n" + 
					"<script>\r\n" + 
					"  function signOut() {\r\n" + 
					"    var auth2 = gapi.auth2.getAuthInstance();\r\n" + 
					"    auth2.signOut().then(function () {\r\n" + 
					"      console.log('User signed out.');\r\n" + 
					"    });\r\n" + 
					"  }\r\n" + 
					"</script>");*/

			
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
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

}
