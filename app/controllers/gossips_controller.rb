class GossipsController < ApplicationController
  before_action :authenticate_user, only: [:create, :new]


  def show # Méthode qui récupère le potin concerné et l'envoie à la view show (show.html.erb) pour affichage
    @gossip = Gossip.find(params[:id])
    
  end

  def index  # Méthode qui récupère tous les potins et les envoie à la view index (index.html.erb) pour affichage
    @gossips = Gossip.all
    puts params[:user_entry]  
    
  end

  def new  # Méthode qui crée un potin vide et l'envoie à une view qui affiche le formulaire pour 'le remplir' (new.html.erb)
     @gossip = Gossip.new
    
  end

  def create
    puts '$'*50
        puts params
        puts '$'*50
     anonymous = User.create(city: City.first)
    @gossip = Gossip.new(title: params[:gossip][:title], content: params[:gossip][:content], user: anonymous)
    
      if 
        @gossip.save
        redirect_to root_path, success: "gossip crée avec succès"
        
      else
        puts '$'*50
        puts @gossip.errors.messages
        puts '$'*50
        render 'new'
      end
    end
 


  def edit
    # Méthode qui récupère le potin concerné et l'envoie à la view edit (edit.html.erb) pour affichage dans un formulaire d'édition
    @gossip = Gossip.find(params[:id])

  end

  def update
    # Méthode qui met à jour le potin à partir du contenu du formulaire de edit.html.erb, soumis par l'utilisateur
    # pour info, le contenu de ce formulaire sera accessible dans le hash params
    # Une fois la modification faite, on redirige généralement vers la méthode show (pour afficher le potin modifié)
    @gossip = Gossip.find(params[:id])
    if @gossip.update(title: params[:gossip][:title], content: params[:gossip][:content])
      redirect_to @gossip
    else 
      render :edit
      puts '*'*50
      puts @gossip.errors.messages
    end
  end

  def destroy
    # Méthode qui récupère le potin concerné et le détruit en base
    # Une fois la suppression faite, on redirige généralement vers la méthode index (pour afficher la liste à jour)
    @gossip = Gossip.find(params[:id])
    if @gossip.destroy 
    redirect_to root_path
    else render 'show'
    end
end

private

private

def authenticate_user
  unless current_user
    flash[:danger] = "Connecte toi pour poster un commentaire ou créer un potin"
    redirect_to signin_path
  end
end
end
