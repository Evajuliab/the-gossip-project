class CommentsController < ApplicationController
  before_action :authenticate_user, only: [:create]

  def create
    @gossip = Gossip.find(params[:gossip_id])
    @comment = @gossip.comments.create(params[:comment].permit(:name, :body))
    redirect_to gossip_path(@gossip)
  end

  def update
    @gossip = Gossip.find(params[:gossip_id])
     @comment.update(title: params[:gossip][:title], body: params[:gossip][:body])
      redirect_to @gossip
   
  end



  def destroy
    @gossip = Gossip.find(params[:gossip_id])
    @comment = @gossip.comments.find(params[:id])
    @comment.destroy
    redirect_to gossip_path(@gossip)

  end

  private

  def authenticate_user
    unless current_user
      flash[:danger] = "Connecte toi pour poster un commentaire ou créer un potin"
      redirect_to signin_path
    end
  end


end
