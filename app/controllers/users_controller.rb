class UsersController < ApplicationController
  before_action :require_signed_out, only: [:new, :create]
  before_action :require_signed_in, only: [:edit, :update, :destroy]

  def index
    @users = User.all
    
    render :index
  end

  def new
    @user = User.new

    render :new
  end

  def create
    @user = User.new(signup_params)
    if @user.save
      login(@user)
      redirect_to root_url
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    if @user
      render :show
    else
      flash.now[:errors] = @user.errors.full_messages
    end
  end

  def edit
    @user = User.find(params[:id])
    render :edit
  end

  def update
    @user = User.find(params[:id])
    
    unless saved_user_params.empty?
      new_user = User.find(saved_user_params[:saved_user_id])
      @user.saved_users << new_user
      redirect_to user_url(@user)
      return
    end
    
    unless ignored_user_params.empty?
      new_user = User.find(ignored_user_params[:ignored_user_id])
      @user.ignored_users << new_user
      redirect_to user_url(@user)
      return
    end

    if @user.update(profile_params)
      redirect_to user_url(@user)
    else
      flash.now[:errors] = @user.errors.full_messages
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      redirect_to new_user_url
    else
      flash.now[:errors] = @user.errors.full_messages
    end
  end

  def signup_params
    params.require(:user).permit(:username, :email, :password)
  end

  def profile_params
    params.require(:user).permit(:username,
                                 :email,
                                 :profile_photo,
                                 :life_goals,
                                 :job,
                                 :hobbies,
                                 :reason_to_meet,
                                 :relationship_status,
                                 :personality_type)

  end
  
  def saved_user_params
    params.require(:user).permit(:saved_user_id)
  end
  
  def ignored_user_params
    params.require(:user).permit(:ignored_user_id)
  end
end
