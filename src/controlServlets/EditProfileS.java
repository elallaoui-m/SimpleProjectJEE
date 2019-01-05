package controlServlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class EditProfileS
 */
@WebServlet("/EditProfileS")
public class EditProfileS extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditProfileS() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		String email = request.getParameter("email");
		ImplUtilisateur ImUs = new ImplUtilisateur();
		Utilisateur Us = ImUs.searchebyEmail(email);
		System.out.println("here1");
		if(!Us.equals(null))
		{
			if (Us.getMotdepass().equals(request.getParameter("Oldpass")))
			{
				System.out.println("here2");
				Utilisateur newU = new Utilisateur();
				//newU.setEmail(email);
				newU.setNom(request.getParameter("lastname"));
				newU.setPrenom(request.getParameter("firstname"));
				newU.setMotdepass(request.getParameter("pass"));
				newU.setDateN(request.getParameter("birthday"));
				newU.setType(request.getParameter("role"));
				newU.setGender(request.getParameter("gender"));
				ImUs.updateUtilis(Us.getIdEtudiant(),newU);
				System.out.println("here4");
				

				request.getRequestDispatcher("index.html").forward(request, response);

			}
			else 
			{
				System.out.println("here3");
				request.setAttribute("wrongPass", "1");
				request.getRequestDispatcher("Editincription.jsp").forward(request, response);
				
			
			}
		}
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		
	}

}
