package controlServlets;

import java.util.List;

public interface DAOUtilisateur {
	
	// creation d'un utilisateur
	public void CreateUtilis (Utilisateur util);
	
	// Trouver un utilisateur avec id
	public Utilisateur FindUtilis (int id);

	// authentification : si n'a pas trouver va retourner null
	public Utilisateur Authentifier(String email,String motdepass);
	
	// modificatio de nom-prenom-dateN-Motdepass
	public void updateUtilis (int id,Utilisateur utilis);

	// supprimer un utilisateur
	public void deleteUtilis (int id);
	
	public List<Utilisateur> ShowAllUsers();
	

}
