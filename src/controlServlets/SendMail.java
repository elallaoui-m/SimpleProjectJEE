package controlServlets;

import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;

public class SendMail 
{ 
    public static void send(String to, String sub, 
                         String msg, final String user,final String pass)
    { 
     //create an instance of Properties Class   
    	Properties props = new Properties();
    	props.put("mail.imap.ssl.enable", "true"); // required for Gmail
    	props.put("mail.imap.sasl.enable", "true");
    	props.put("mail.imap.sasl.mechanisms", "XOAUTH2");
    	props.put("mail.imap.auth.login.disable", "true");
    	props.put("mail.imap.auth.plain.disable", "true");
    	Session session = Session.getInstance(props);
    	Store store;
		try {
			store = session.getStore("imap");
	    	store.connect("imap.gmail.com", "anwarsami1998@gmail.com", "922252162446-9djl5kksq5beha2m35a0aoo5vshj398e.apps.googleusercontent.com");
		} catch (MessagingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
    
   try
   {
 
 	/* Create an instance of MimeMessage, 
 	      it accept MIME types and headers 
 	   */
 
	   MimeMessage message = new MimeMessage(session);
       message.setFrom(new InternetAddress(user));
       message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));
       message.setSubject(sub);
       message.setText(msg);

       /* Transport class is used to deliver the message to the recipients */
       
       Transport.send(message);
 
 
    }
    catch(Exception e)
    {
    	 e.printStackTrace();
    }
  }  
}