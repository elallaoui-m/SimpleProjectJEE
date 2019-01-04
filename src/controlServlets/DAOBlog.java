package controlServlets;

import java.util.List;

public interface DAOBlog {
	
	
	public void createBlog(Blog blog,Utilisateur util);
	
	public Blog FindBlog (int id);
	// change title and date and description
	public void UpdateBlog(int id,Blog blog);
	
	
	public void DeleteBlog(int id);
	
	
	public List<Blog> ShowAllBlog();
	
	public List<Blog> RechercheBlog(String words);

}
