package controlServlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddContact
 */
@WebServlet("/AddContact")
public class AddContact extends HttpServlet {
	private String msg;
	private String name;
	private String email;
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddContact() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 
		doPost(request, response);
				
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		msg = request.getParameter("message");
		name = request.getParameter("name");
		email = request.getParameter("email");
		Contact ct = new Contact(email,msg,name);
		ImplContact imcon = new ImplContact();
		imcon.addMsg(ct);
		
		request.setAttribute("to", "elallaoui.elmehdi@gmail.com");
		request.setAttribute("subject", "Contact Email from AskSa");
		request.setAttribute("message", "from:"+email+"<br>msg:"+msg);
		request.setAttribute("user", "anwarsami1998@gmail.com");
		request.setAttribute("pass", "wiqo.obim978247");
		request.getRequestDispatcher("/MailApp").forward(request, response);
		
		
		//System.out.println("done");
		
		
	}

}
