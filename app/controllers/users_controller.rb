class UsersController < ApplicationController
  def index
    redirect_to user_path(current_user)
  end

  def new
    if current_user
      redirect_to root_path, alert: 'You are signed in, logout first.'
    else
      @user = User.new
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to edit_user_path(current_user), notice: "Thank you for signing up!"
    else
      render "new"
    end
  end

  def show
  end

  def edit
  end

  def update
    if current_user.update_attributes(user_params)
      redirect_to user_path(current_user)
    else
      render 'edit'
    end
  end

  def destroy
    current_user.destroy
    session[:user_id] = nil
    redirect_to '/signup'
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name, :city, :country, :avatar)
  end
end
