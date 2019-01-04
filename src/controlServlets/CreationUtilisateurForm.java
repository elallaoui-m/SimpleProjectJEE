package controlServlets;

import javax.servlet.http.HttpServletRequest;


public class CreationUtilisateurForm {
	private static final String CHAMP_NOM       = "first-name";
    private static final String CHAMP_PRENOM    = "lastname";
    private static final String CHAMP_EMAIL    = "email";
    private static final String CHAMP_PHONE    = "phonenumber";
    private static final String CHAMP_DAY    = "day";
    private static final String CHAMP_MONTH    = "month";
    private static final String CHAMP_YEAR    = "year";
    private static final String CHAMP_PASSWORD    = "pass";
    private static final String CHAMP_CONFPASSWORD   = "confirm";
	
    
   private ImplUtilisateur impUser;
    public CreationUtilisateurForm(ImplUtilisateur impUser) {
		this.impUser=impUser;
		System.out.println("Enter11111");
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
        /*String nom = getValeurChamp( request, CHAMP_NOM );
        String prenom = getValeurChamp( request, CHAMP_PRENOM );
        String email = getValeurChamp( request, CHAMP_EMAIL );
        String phone = getValeurChamp( request, CHAMP_PHONE );
        String day = getValeurChamp( request, CHAMP_DAY );
        String month = getValeurChamp( request, CHAMP_MONTH );
        String year = getValeurChamp( request, CHAMP_YEAR );
        String password = getValeurChamp( request, CHAMP_PASSWORD );
        String verify = getValeurChamp( request, CHAMP_CONFPASSWORD );*/
    	String nom = "bader";
        String prenom = "eddine";
        String email = "bader@gmail.com";
        String phone = "0625881218";
        String day = "13";
        String month ="06";
        String year =  "1998";
        String password ="Password1234";
        String verify = "Password1234";
        System.out.println("Enter22222");
        

        Utilisateur utlisateur = new Utilisateur();

        traiterNom( nom, utlisateur );
        traiterPrenom( prenom, utlisateur );
        traiterEmail( email, utlisateur );
        traiterDate(day,month,year,utlisateur);
        traitertype( utlisateur );
        traiterpassword( password,verify, utlisateur );
        
        

        try {
            	
                impUser.CreateUtilis( utlisateur );
                
            
        } catch ( DAOException e ) {
            
        }

        return utlisateur;
    }
    private void traiterNom( String nom, Utilisateur user ) {
        try {
            validationNom( nom );
        } catch ( FormValidationException e ) {
           
        }
        user.setNom( nom );
    }
    
    private void traiterPrenom( String prenom, Utilisateur user ) {
        try {
            validationprenom( prenom );
        } catch ( FormValidationException e ) {
           
        }
        user.setPrenom( prenom );
    }
    
    private void traiterEmail( String email, Utilisateur user ) {
        try {
            validationemail( email );
        } catch ( FormValidationException e ) {
           
        }
        user.setEmail(email);
    }
    
    private void traiterDate( String day,String month,String year, Utilisateur user ) {
        
            String dateN=day+"-"+month+"-"+year;
            user.setDateN(dateN);
         }
    private void traitertype(  Utilisateur user ) {
        
        String type="user";
        user.setType(type);
     }
private void traiterpassword(String pass,String verify,  Utilisateur user ) {
        
        if(pass==verify) {user.setMotdepass(pass);}
       
     }
    
    private void validationNom( String nom ) throws FormValidationException {
        if ( nom != null ) {
            if ( nom.length() < 2 ) {
                throw new FormValidationException( "Le nom d'utilisateur doit contenir au moins 2 caract�res." );
            }
        } else {
            throw new FormValidationException( "Merci d'entrer un nom d'utilisateur." );
        }
    }
    private void validationprenom( String prenom ) throws FormValidationException {
        if ( prenom != null ) {
            if ( prenom.length() < 2 ) {
                throw new FormValidationException( "Le prenom d'utilisateur doit contenir au moins 2 caract�res." );
            }
        } else {
            throw new FormValidationException( "Merci d'entrer un prenom d'utilisateur." );
        }
    }
    private void validationemail( String email ) throws FormValidationException {
        if ( email != null && !email.matches( "([^.@]+)(\\.[^.@]+)*@([^.@]+\\.)+([^.@]+)" ) ) {
            throw new FormValidationException( "Merci de saisir une adresse mail valide." );
        }
    }
    
    
    

}
