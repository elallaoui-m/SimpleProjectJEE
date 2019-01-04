package controlServlets;

import java.util.List;

public interface DAOComment {
	
	public void AddComment(Commentaire comm,Blog b,Utilisateur util);//done
	
	public void ModifyComment(int id, Commentaire comm);//done
	
	public void DeleteComment(int id);//done
	
	public List<Commentaire> GetComments(int id_blog);//done
	
	public List<Commentaire> FindCommnet(String words);//
	
	public void Upvote(int id_comment);
	
}
