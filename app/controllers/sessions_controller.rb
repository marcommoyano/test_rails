class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:email].downcase)

    if user && user.authenticate(params[:password])
      log_in user
      flash[:success] = "Bienvenido #{user.username}!"

      character = user.character
      
      if character.present?
        redirect_to character
      else 
        redirect_to new_character_path
      end
    else
      flash[:danger] = 'Email y/o contraseña incorrecta'
      render 'new'
    end
  end

  def login
  end

  def destroy
    session.delete(:user_id)
    @current_user = nil
    redirect_to login_path
  end
  
end
