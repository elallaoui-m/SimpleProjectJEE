package controlServlets;

// File Name SendEmail.java
import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.mail.*;
import javax.mail.internet.*;
 
@WebServlet("/SendEmail")
public class SendEmail extends HttpServlet {
    
   /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

public void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
      
	
      // Recipient's email ID needs to be mentioned.
      String to = "elallaoui.elmehdi@gmail.com";
 
      // Sender's email ID needs to be mentioned
      String from = "anwarsami1998@gmail.com";
 
      // Assuming you are sending email from localhost
      String host = "localhost";
 
      // Get system properties
      Properties properties = System.getProperties();
 
      // Setup mail server
      /*properties.setProperty("mail.smtp.host", host);*/
      properties.setProperty("smtp.gmail.com", host);
      //properties.setProperty("mail.user", "anwarsami1998@gmail.com");
      //properties.setProperty("mail.password", "wiqo.obim978247");
      properties.put("mail.smtp.starttls.enable", "true"); 
      properties.put("mail.smtp.host", "smtp.gmail.com");
      properties.put("mail.smtp.user", "anwarsami1998@gmail.com"); // User name
      properties.put("mail.smtp.password", "wiqo.obim978247"); // password
      properties.put("mail.smtp.port", "587");
      properties.put("mail.smtp.auth", "true");
 
      // Get the default Session object.
      Session session = Session.getInstance(properties, new javax.mail.Authenticator() {
    	    protected PasswordAuthentication getPasswordAuthentication() {
    	        return new PasswordAuthentication("anwarsami1998@gmail.com", "wiqo.obim978247");
    	    }
    	});
      
      // Set response content type
      response.setContentType("text/html");
      PrintWriter out = response.getWriter();

      try {
         
         // Create a default MimeMessage object.
         MimeMessage message = new MimeMessage(session);
         
         // Set From: header field of the header.
         message.setFrom(new InternetAddress(from));
         
         // Set To: header field of the header.
         message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
         // Set Subject: header field
         message.setSubject("Email from AskSa");

         // Send the actual HTML message, as big as you like
         message.setContent("<h1>This is actual message</h1>", "text/html" );
         
         // Send message
         Transport.send(message);
         String title = "Send Email";
         String res = "Sent message successfully....";
         String docType =
         "<!doctype html public \"-//w3c//dtd html 4.0 " + "transitional//en\">\n";
         
         out.println(docType +
            "<html>\n" +
               "<head><title>" + title + "</title></head>\n" +
               "<body bgcolor = \"#f0f0f0\">\n" +
                  "<h1 align = \"center\">" + title + "</h1>\n" +
                  "<p align = \"center\">" + res + "</p>\n" +
               "</body></html>"
            
         );
      } catch (MessagingException mex) {
         mex.printStackTrace();
      }
   }
} 