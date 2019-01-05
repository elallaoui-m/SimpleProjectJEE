package controlServlets;

public interface DAOLikes {
	
	public void Like(Like lik);//Done
	
	public void RemoveLike(int id_blog, int id_comment, int id_etudiant);//Done
	
	public void WachDrtLikeOlaLa (int id_commentaire, int id_blog, int id_etudiant);
	
	public int GetLikesOfAComment(int id_blog, int id_comment);
}
