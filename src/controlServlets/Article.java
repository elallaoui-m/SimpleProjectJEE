package controlServlets;

import java.sql.DriverManager;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.ResultSet;
import com.mysql.jdbc.Statement;

public class Article {

	private int idBlog;
	private String dateBlog;
	private String description;
	private String titre;
	private int id_etudiant;
	public int getIdBlog() {
		return idBlog;
	}
	public void setIdBlog(int idBlog) {
		this.idBlog = idBlog;
	}
	public String getDateBlog() {
		return dateBlog;
	}
	public void setDateBlog(String dateBlog) {
		this.dateBlog = dateBlog;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getTitre() {
		return titre;
	}
	public void setTitre(String titre) {
		this.titre = titre;
	}
	public int getId_etudiant() {
		return id_etudiant;
	}
	public void setId_etudiant(int id_etudiant) {
		this.id_etudiant = id_etudiant;
	}
	
	public List<Article> ShowAllArticle() throws SQLException
	{
		List<Article> blog = new ArrayList<Article>();
		
		String sql = "SELECT * FROM `blog`";   //order by `date` desc 
		
		 Connection connection=null;
	        try {
	            Class.forName("com.mysql.jdbc.Driver");
	        } catch (ClassNotFoundException e) {
	        }

	        try {
	        	 connection = (Connection) DriverManager.getConnection("jdbc:mysql://localhost/blogdatabase", "root", "");
	        } catch (SQLException e) {
	        	 e.printStackTrace();
	        }
		
		Statement statement = (Statement) connection.createStatement();
		//DateFormat formatDate = new SimpleDateFormat("yyyy-MM-dd");
		ResultSet res = (ResultSet) statement.executeQuery(sql);
		
		
		while(res.next())
		{
			Article ann = new Article();
			
			ann.setIdBlog(res.getInt(1));
			ann.setTitre(res.getString(2));
			ann.setDateBlog(res.getString(3));
			ann.setDescription(res.getString(4));
			ann.setId_etudiant(res.getInt(5));
			
			/*Date maDate = res.getDate(5);
			String datt=formatDate.format(maDate);
			ann.setDatepub(datt); */
			
			
			 
           
			
			blog.add(ann);
		}
		
		connection.close();
		
	
	
	return blog;
	}
}
