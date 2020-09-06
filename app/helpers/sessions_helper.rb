module SessionsHelper
  #Créer une méthode d'assistance pour afficher la session
    #de l'user connecté 
    def current_user
      #Si @current_user est faux lui attribuer ceci. 
      @current_user ||= User.find_by(id: session[:user_id])
  end

  
  #Définir une Méthode qui renvoie True si l'utilisateur 
  #est connecté
  def logged_in?
      current_user.present?
  end
end
