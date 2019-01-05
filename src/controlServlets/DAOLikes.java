package controlServlets;

public interface DAOLikes {
	
	public boolean Like(int id_blog, int id_comment, int id_etudiant);//Done
	
	public boolean RemoveLike(int id_blog, int id_comment, int id_etudiant);//Done
	
	public boolean WachDrtLikeOlaLa (int id_commentaire, int id_blog, int id_etudiant);//Done
	
	public int GetLikesOfAComment(int id_blog, int id_comment);//done
}
