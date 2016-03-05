class Admin::UsersController < ApplicationController
  
  def index
    if current_user.is_admin
      @users = User.order(:id).page params[:page]
      @movies = Movie.all.order(:id).page params[:page]
    else
      redirect_to root_path
    end
    @admin_count = admin_count
  end

  def destroy
    if current_user.is_admin
      @user = User.find(params[:id])
      @user.destroy
      redirect_to admin_users_path, notice: "Successfully delete #{@user.full_name}."
    else
      flash.now[:alert] = "There was a problem with your request."
      redirect_to admin_users_path
    end
  end

  def edit
    @user = User.find(params[:id])
  end

   def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admin_users_path, notice: "#{@user.full_name} was updated successfully."
    else
      render :'admin/users/:id/edit'
    end
  end

  protected

  def admin_count
    @user = User.all
    @admins = []
    @user.each do |user|
      if user.is_admin == true
        @admins << user
      end
    end
    @admins.count
  end

  def user_params
    params.require(:user).permit(:email, :firstname, :lastname, :is_admin)
  end


end