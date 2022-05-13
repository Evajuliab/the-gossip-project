class SessionsController < ApplicationController
  
def new
  user = User.new(email: params[:email],
  password: params[:password],
  password_confirmation: params[:password])
end

 
  def create
    user = User.find_by(email: params[:email])   # cherche s'il existe un utilisateur en base avec l’e-mail

      # on vérifie si l'utilisateur existe bien ET si on arrive à l'authentifier (méthode bcrypt) avec le mot de passe 

    if user && user.authenticate(params[:password])
     session[:user_id] = user.id
     redirect_to root_path, notice: "logged in succesfully"
    else
      flash[:alert] = 'mot de passe ou email incorrect'
    redirect_to '/signin'
    puts '$'*50
    puts params
   
    end
   
end

  def destroy
    session.delete(:user_id)
    redirect_to '/signin'
 end


end
