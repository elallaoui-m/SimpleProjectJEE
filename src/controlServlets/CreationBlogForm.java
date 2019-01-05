package controlServlets;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;

public class CreationBlogForm {
	private static final String CHAMP_TITRE       = "titre";
    private static final String CHAMP_DESCRIPTION    = "description";
    private static final String CHAMP_DATE    = "date";
    
    
    private String              resultat;
    private Map<String, String> erreurs         = new HashMap<String, String>();
   private ImpBlog impBlog;
  
		
    public CreationBlogForm(ImpBlog impBlog) {
	this.impBlog=impBlog;
}
	private static String getValeurChamp( HttpServletRequest request, String nomChamp ) {
        String valeur = request.getParameter( nomChamp );
        if ( valeur == null || valeur.trim().length() == 0 ) {
            return null;
        } else {
            return valeur;
        }
    }
    public Map<String, String> getErreurs() {
        return erreurs;
    }

    public String getResultat() {
        return resultat;
    }
    public Blog CreerBlog( HttpServletRequest request ) {
        String titre = getValeurChamp( request, CHAMP_TITRE );
        String description = getValeurChamp( request, CHAMP_DESCRIPTION );
        String date = getValeurChamp( request, CHAMP_DATE );
       Utilisateur user=new Utilisateur();
       user =(Utilisateur)request.getSession().getAttribute("Myuser");
       SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

       Date dateSys = new Date();

       String frmtdDate = dateFormat.format(dateSys);

      
    	
       
        Blog blog = new Blog();
        blog.setUtilisateur(user);
        blog.setDateBlog(frmtdDate);
        traiterTitre( titre, blog );
        traiterDescription( description, blog );
        
        
        

        try {
        	if ( erreurs.isEmpty() ) {
                //impBlog.createBlog(blog, util);
                
                resultat = "Succ�s de la cr�ation de blog.";
            } else {
                resultat = "�chec de la cr�ation de bolg.";
            }
        } catch ( DAOException e ) {
        	 setErreur( "impr�vu", "Erreur impr�vue lors de la cr�ation." );
             resultat = "�chec de la c�ation : une erreur impr�vue est survenue, merci de r�essayer dans quelques instants.";
             e.printStackTrace();
            
        }

        return blog;
    }
    
    
    
    private void traiterTitre( String titre, Blog blog ) {
        try {
            validationTitre( titre );
        } catch ( FormValidationException e ) {
        	//setErreur( CHAMP_TITRE, e.getMessage() );
           
        }
        blog.setTitre(titre);
    }  
    private void traiterDescription( String descrip, Blog blog ) {
        try {
            validationDescription( descrip );
        } catch ( FormValidationException e ) {
        	//setErreur( CHAMP_TITRE, e.getMessage() );
           
        }
        blog.setDescription(descrip);
    }
    private void validationTitre( String titre ) throws FormValidationException {
        if ( titre != null ) {
            if ( titre.length() < 5 ) {
                throw new FormValidationException( "Le titre doit contenir au moins 5 caractaires." );
            }
        } else {
            throw new FormValidationException( "Merci d'entrer un titre de blog." );
        }
    }
    private void validationDescription( String titre ) throws FormValidationException {
        if ( titre != null ) {
            if ( titre.length() < 10 ) {
                throw new FormValidationException( "Le description du blog est tr�s court ." );
            }
        } else {
            throw new FormValidationException( "Merci d'entrer une description de votre blog." );
        }
    }
    
    private void setErreur( String champ, String message ) {
        erreurs.put( champ, message );
    }
}
