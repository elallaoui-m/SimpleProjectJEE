package controlServlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MailApp
 */
@WebServlet("/MailApp")
public class MailApp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        String to = (String) request.getAttribute("to");
        String subject = (String)request.getAttribute("subject");
        String message =  (String)request.getAttribute("message");
        String user = (String)request.getAttribute("user");
        String pass = (String)request.getAttribute("pass");
        
        SendMail.send(to,subject, message, user, pass);
        out.println("Mail send successfully");
    }  

}
