class UsersController < ApplicationController

    def show
        @user = User.find(params[:id])
      end


      def create
        @user = User.new(email: params[:email], password: params[:password], password_confirmation: params[:password])
        if @user.save 
          session[:user_id] = @user.id
          redirect_to root_path
        else
          redirect_to '/signup'
        end
      end

 
      
end
