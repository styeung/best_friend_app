class UsersController < ApplicationController
  before_action :require_signed_out, only: [:new, :create]
  before_action :require_signed_in, only: [:edit, :update, :destroy]

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
end
