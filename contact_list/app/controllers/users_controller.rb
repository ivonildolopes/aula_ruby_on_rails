class UsersController < ApplicationController

    before_action :require_logged_in_user, only: [:edit, :update]
    # before_action :set_user, only: [:show, :edit, :update, :destroy]

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

    def edit
        @user = current_user
    end   
    
    def update
        #  raise params.inspect;
        # respond_to do |format|
        #     if @user.update(user_params)
        #       format.html { redirect_to @user, notice: 'Usuario atualizado com sucesso.' }
        #       format.json { render :show, status: :ok, location: @user }
        #     else
        #       format.html { render :edit }
        #       format.json { render json: @user.errors, status: :unprocessable_entity }
        #     end
        #   end
        if current_user.update(user_params)
            flash[:success] = "Usuario alterado com sucesso"
            redirect_to contacts_path;
        else
            flash.now[:danger] = "erro ao tentar alterar usuario, tente mais tarde"
            render 'edit' 
            # redirect_to contacts_path;
        end  

    end

    private
        def user_params
            params.require(:user).permit(:email, :name, :password, :password_confirmation)
        end    


end
