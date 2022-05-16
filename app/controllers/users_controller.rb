class UsersController < ApplicationController

    def show
        @user = User.find(params[:id])
      end

      def new
        @user = User.new
      end

      def create
        @user = User.new(first_name: params[:first_name], email: params[:email], password: params[:password], password_confirmation: params[:password])
        if @user.save 
          session[:user_id] = @user.id
          redirect_to root_path
        else
          redirect_to new_user_path
        end
      end

  

 
      
end
