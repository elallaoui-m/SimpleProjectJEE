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
           
          // message.setContent("<h1>"+link+"?id="+id+"&token="+token+ "</h1>", "text/html" );
           String contentEmail = "<!DOCTYPE html>\r\n" + 
              		"<html><head>\r\n" + 
               		"\r\n" + 
               		"    </head>\r\n" + 
               		"    <body style=\"\r\n" + 
               		"    box-sizing: border-box;padding: 0px;margin: 0px;ing: 0px;\">\r\n" + 
               		"        <div class=\"container-mail\" style=\"\r\n" + 
               		"background-color: #f0f0f0;\r\n" + 
               		"    width: 100%;/* margin-top: 22px; */max-width: 900px;/* height: 100vh; */; margin: auto;\">\r\n" + 
               		"            <div class=\"container-panel\" style=\"\r\n" + 
               		"max-width: 700px;margin: auto;width: 100%;n: auto;padding-bottom: 64px;\">\r\n" + 
               		"                <div class=\"header-mail\">\r\n" + 
               		"                    <div style=\"\r\n" + 
               		"    width: 150px;margin: auto;display: flex;justify-content: center;padding: 13px 0px;\">\r\n" + 
               		"    <img src=\"https://doc-0c-3c-docs.googleusercontent.com/docs/securesc/r92m9opjqp6tlklhuh4bj74prc8eimru/hage5gnhol3909o9anvpoqagu59db3p9/1547388000000/02660810507220904979/13333490986103785041/1IxaXdL4GtDGtgciabJNRlehqKjSiJmP3?e=download&nonce=3ti2jc7jqi4ni&user=13333490986103785041&hash=90dlqg0k4mtfvpv146lf8qiodkg9qkrj\" style=\"\r\n" + 
               		"    max-width: 100%;height: 53px;th: 100%;\">\r\n" + 
               		"                    </div>\r\n" + 
               		"                </div>\r\n" + 
               		"                <div class=\"body-mail\" style=\"\r\n" + 
               		"/* height: 100vh; */background: white;padding: 10px 29px;\">\r\n" + 
               		"                    <h2 style=\"\r\n" + 
               		"color: #404040;\r\n" + 
               		"font-size: 22px;\r\n" + 
               		"font-weight: bold;\r\n" + 
               		"line-height: 26px;font-family: Roboto,RobotoDraft,Helvetica,Arial,sans-serif;\">\r\n" + 
               		"                        Hi "+to+",\r\n" + 
               		"            </h2>\r\n" + 
               		"            <p>\r\n" + 
               		"                    Confirmation email \r\n" + 
               		"                    This message contain you activation link sent to you after your registration in AskSa  \r\n" + 
               		"                    Click on the link below to activate your account  \r\n" + 
               		"                    <h1>"+link+"?id="+id+"&token="+token+ "</h1>"+
               		"                    if you did not request this email just delete it, it may be sent to you by mistake\r\n" + 
               		"            </p>\r\n" + 
               		"                </div>\r\n" + 
               		"            </div>\r\n" + 
               		"        </div>\r\n" + 
               		"    \r\n" + 
               		"    </body></html>" ;
           message.setContent(contentEmail, "text/html" );
           
           // Send message
           Transport.send(message);
           
        } catch (MessagingException mex) {
           mex.printStackTrace();
        }
     }
    }