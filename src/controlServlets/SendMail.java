package controlServlets;

import java.io.PrintWriter;
import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;

public  class SendMail 
{ 
	static void sendEmail(String to, String token, String id)
    {
    	// Recipient's email ID needs to be mentioned.
        
   
        // Sender's email ID needs to be mentioned
        String from = "anwarsami1998@gmail.com";
   
        // Assuming you are sending email from localhost
        String host = "localhost";
        String link = "http://localhost:8080/SimpleProjectJEE/ActivateAccount";
   
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
           message.setContent("<h1>"+link+"?id="+id+"&token="+token+ "</h1>", "text/html" );
           
           // Send message
           Transport.send(message);
           
        } catch (MessagingException mex) {
           mex.printStackTrace();
        }
     }
    }