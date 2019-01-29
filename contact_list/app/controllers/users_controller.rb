class UsersController < ApplicationController

    def new  
        @user = User.new      
    end

    def create
        # raise params.inspect;
        @user = User.new(user_params)
        # @user.name = params[:user][:name]
        # @user.email = params[:user][:email]
        # @user.password = params[:user][:password]

        if @user.save
            flash[:success] = "Usuario cadastrado com sucesso"
            redirect_to root_url
        else
            render 'new' 
        end   
        # raise @user.inspect
    end


    private
        def user_params
            params.require(:user).permit(:email, :name, :password, :password_confirmation)
        end    


end
