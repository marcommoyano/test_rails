class CharactersController < ApplicationController
  before_action :verify_session

  def show
    @character = current_user.character
  end

  def new
    session[:character_params] = {}
    @character = Character.new(session[:character_params])
    @character.current_step = @character.steps.first
    session[:character_step] = @character.current_step
  end

  def create
    session[:character_params].deep_merge!(character_params) if character_params
    @character = Character.new(session[:character_params])
    @character.current_step = session[:character_step]
    @types = Type.all.order(:name)
    @colors = Color.all.order(:name)

    if params[:previous_button]
      @character.previous_step
    elsif @character.last_step?
      @character.user_id = current_user.id
      unless @character.valid?
        flash[:danger] = "No pueden dejarse campos en blanco"
        return render 'new'
      end
      if @character.save
        flash[:success] = "Personaje creado!"
        return redirect_to @character
      end
    else
      @character.next_step
    end
    
    session[:character_step] = @character.current_step
    render 'new'
  end

  private

  def character_params
    # return {} if params[:character].blank?
    params.permit(:name, :color_id, :type_id)
  end

  def verify_session
    redirect_to login_path unless logged_in?
  end
end
