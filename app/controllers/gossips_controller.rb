class GossipsController < ApplicationController
  def show
    @gossip = Gossip.find(params[:id])
    
  end

  def index
    @gossips = Gossip.all
    puts params[:user_entry]  
    
    
  end

  def new
  end
end
