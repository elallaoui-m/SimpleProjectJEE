package controlServlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class EditeBlogS
 */
@WebServlet("/EditeBlogS")
public class EditeBlogS extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ImpBlog impblog=new ImpBlog();
	CreationBlogForm form=new CreationBlogForm(impblog);
	
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditeBlogS() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Utilisateur us = (Utilisateur) request.getSession(false).getAttribute("Myuser");
		if(us == null || us.getEmail()==null)
		{
			response.sendRedirect("ifError.jsp");
			System.out.println("error");
		}
		else
		{ 
			String idblog = request.getParameter("BlogId");
			 int id=Integer.parseInt(idblog);
	
			 Blog upblog=form.UpdateBlog(request, id);
			 if(upblog!=null)
			 { 
				 request.getRequestDispatcher("/HomePageS").forward(request, response);
				 System.out.println(form.getResultat());
			 }
			     System.out.println("here1 blog up");
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
