class UsersController < ApplicationController
    
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id # Automatic login upon registering
      UserMailer.welcome_email(@user).deliver
      redirect_to movies_path, notice: "Hey #{@user.firstname}! Welcome to Netflix Reviews!"
    else
      render :new
    end
  end

  protected

  def user_params
    params.require(:user).permit(:email, :firstname, :lastname, :password, :password_confirmation, :is_admin)
  end

end
