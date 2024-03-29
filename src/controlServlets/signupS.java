package controlServlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ThreadLocalRandom;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class signupS
 */
@WebServlet("/signupS")
public class signupS extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ImplUtilisateur impuser= new ImplUtilisateur();
	CreationUtilisateurForm uss=new CreationUtilisateurForm(impuser);
	String token;
	String errorr = "yes";
	
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public signupS() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");  
	    //PrintWriter out = response.getWriter();
		
		Map<String,String> error;
		String s = request.getParameter("email");
		Utilisateur us = (new ImplUtilisateur()).searchebyEmail(s);
		if(us !=  null )
		{
			error = new HashMap<String, String>();
			error.put("email", "aleady used email");
			request.setAttribute("error","true");
			request.setAttribute("errorList", error);
		}
		else
		{
			RandomString gen = new RandomString(8, ThreadLocalRandom.current());
	        token = gen.nextString();
	        request.setAttribute("token",token);
			uss.creerUser(request);
			error = uss.getErreurs();
			System.out.println(error);
			if( error.size()>0)
			{
				request.setAttribute("error","true");
				request.setAttribute("errorList", error);
				System.out.println("out");
				//request.getRequestDispatcher("/SimpleProjectJEE/inscription.jsp").forward(request, response);
			}
			else
			{
				
				us = (new ImplUtilisateur()).searchebyEmail(s);
				SendMail.sendEmail(us.getEmail(), token, String.valueOf(us.getIdEtudiant()));
				//request.setAttribute("error","no");
				errorr = "no";
				
				//request.setAttribute("msg", "your account is created with success<br>check your email to activate your email!");
				
			}
			System.out.println("in");
			response.sendRedirect("/SimpleProjectJEE/Login.jsp?error="+errorr);
			
		}
		
		//request.getRequestDispatcher("/incription.jsp").forward(request, response);
		//request.getRequestDispatcher("/SimpleProjectJEE/Login.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

}
