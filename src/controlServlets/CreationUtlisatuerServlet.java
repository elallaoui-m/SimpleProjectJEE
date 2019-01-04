package controlServlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/CreationUtlisatuerServlet")
public class CreationUtlisatuerServlet extends HttpServlet {
    
   
   
   
    public static final String VUE_FORM         = "/inscription.jsp";

    private ImplUtilisateur          impUser;

    public void init() throws ServletException {
      
    }

    public void doGet( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {
        /* � la r�ception d'une requ�te GET, simple affichage du formulaire */
        //this.getServletContext().getRequestDispatcher( VUE_FORM ).forward( request, response );
    	 /* Pr�paration de l'objet formulaire */
    	response.setContentType("text/html");  
	    PrintWriter out = response.getWriter();
	    System.out.println("Enter000");
        CreationUtilisateurForm form = new CreationUtilisateurForm( impUser );
        

        /* Traitement de la requ�te et r�cup�ration du bean en r�sultant */
        Utilisateur user = form.creerUser(request);
        out.append("okk");
    }

    public void doPost( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {
        

       

       
        

        

            
            //this.getServletContext().getRequestDispatcher( VUE_FORM ).forward( request, response );
   
    }
}