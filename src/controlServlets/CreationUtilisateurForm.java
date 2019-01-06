package controlServlets;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;


public class CreationUtilisateurForm {
	private static final String CHAMP_NOM       = "first-name";
    private static final String CHAMP_PRENOM    = "lastname";
    private static final String CHAMP_EMAIL    = "email";
   // private static final String CHAMP_PHONE    = "phonenumber";
    private static final String CHAMP_DAY    = "day";
    private static final String CHAMP_MONTH    = "month";
    private static final String CHAMP_YEAR    = "year";
    private static final String CHAMP_PASSWORD    = "pass";
    private static final String CHAMP_CONFPASSWORD   = "confirm";
    private static final String CHAMP_GENDER   = "gender";
	
    private String resultat;	
    private Map<String, String> erreurs= new HashMap<String, String>();
   private ImplUtilisateur impUser;
    public CreationUtilisateurForm(ImplUtilisateur impUser) {
		this.impUser=impUser;
		
	}
    public Map<String, String> getErreurs() {
        return erreurs;
    }

    public String getResultat() {
        return resultat;
    }
    private static String getValeurChamp( HttpServletRequest request, String nomChamp ) {
        String valeur = request.getParameter( nomChamp );
        if ( valeur == null || valeur.trim().length() == 0 ) {
            return null;
        } else {
            return valeur;
        }
    }
    
    public Utilisateur creerUser( HttpServletRequest request ) {
    	
    	String gender = getValeurChamp( request, CHAMP_GENDER );
    	
        
            
            
            
        String nom = getValeurChamp( request, CHAMP_NOM );
        String prenom = getValeurChamp( request, CHAMP_PRENOM );
        String email = getValeurChamp( request, CHAMP_EMAIL );
        //String phone = getValeurChamp( request, CHAMP_PHONE );
        String day = getValeurChamp( request, CHAMP_DAY );
        String month = getValeurChamp( request, CHAMP_MONTH );
        String year = getValeurChamp( request, CHAMP_YEAR );
        String password = getValeurChamp( request, CHAMP_PASSWORD );
        String repassword = getValeurChamp( request, CHAMP_CONFPASSWORD );
        
        
    	
        String verify = "yes";
        
        
        

        Utilisateur utlisateur = new Utilisateur();

        traiterNom( nom, utlisateur );
        traiterPrenom( prenom, utlisateur );
        traiterEmail( email, utlisateur );
        traiterDate(day,month,year,utlisateur);
        traitertype( utlisateur );
        traiterpassword( password,repassword, utlisateur );
        
        
        
        utlisateur.setGender(gender);
        utlisateur.setVerify(verify);
      
        impUser.CreateUtilis( utlisateur );
    	
        
        

        try {
        	if ( erreurs.isEmpty() ) {
                impUser.CreateUtilis( utlisateur );
                
                resultat = "Inscription r�ussite.";
            } else {
                resultat = "Inscription echoue.";
            }
               
            
        } catch ( DAOException e ) {
        	setErreur( "impr�vu", "Erreur impr�vue lors de l'inscrption." );
            resultat = "�chec de l'inscrption : une erreur impr�vue est survenue, merci de r�essayer dans quelques instants.";
            e.printStackTrace();
            
        }

        return utlisateur;
    }
    private void traiterNom( String nom, Utilisateur user ) {
       
         String s = validationNom( nom );
         if(!s.equals("")){
        	 setErreur( CHAMP_NOM, "invalide lastname" );
         }
         else
         user.setNom( nom );

    }
    
    private void traiterPrenom( String prenom, Utilisateur user ) {
    	
    	String s = validationprenom( prenom );
        if(!s.equals("")){
       	 setErreur( CHAMP_NOM, "invalide firstname" );
        }
        else
        user.setPrenom( prenom );
    }
    
    private void traiterEmail( String email, Utilisateur user ) {
    	String s = validationemail( email );
        
    	if(!s.equals("")){
        	setErreur( CHAMP_EMAIL, "invalide email" );
    	}
    	else
        user.setEmail(email);
    }
    
    private void traiterDate( String day,String month,String year, Utilisateur user ) {
        
            String dateN=year+"-"+month+"-"+day;
            user.setDateN(dateN);
         }
    private void traitertype(  Utilisateur user ) {
        
        String type="user";
        user.setType(type);
     }
private void traiterpassword(String pass,String repass,  Utilisateur user ) {
        
        if(pass.equals(repass))
        	user.setMotdepass(pass);
        	
      
        else
        	setErreur( CHAMP_PASSWORD, "inccorect pass" );
        
      
        
       
     }
    
    private String validationNom( String nom )  {
        if ( nom != null ) {
            if ( nom.length() < 2 ) {
                return  "Le nom d'utilisateur doit contenir au moins 2 caract�res.";
            }
        } else {
            return "Merci d'entrer un nom d'utilisateur.";
        }
        return "";
    }
    private String validationprenom( String prenom )  {
        if ( prenom != null ) {
            if ( prenom.length() < 2 ) {
                return "Le prenom d'utilisateur doit contenir au moins 2 caract�res.";
            }
        } else {
            return  "Merci d'entrer un prenom d'utilisateur.";
        }
        return "";
    }
    private String validationemail( String email )  {
        if ( email != null && !email.matches( "([^.@]+)(\\.[^.@]+)*@([^.@]+\\.)+([^.@]+)" ) ) {
           return "Merci de saisir une adresse mail valide.";
        }
		return "";
    }
   
            private void setErreur( String champ, String message ) {
                erreurs.put( champ, message );
            }

}
