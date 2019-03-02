class SessionsController < ApplicationController
  def new
  end

  def create
    if request.env['omniauth.auth']
      user = User.create_with_omniauth(request.env['omniauth.auth'])
      session[:user_id] = user.id
      redirect_to user_path(current_user), notice: "Logged in!"
    else
      user = User.find_by_email(params[:email])
      if user && user.authenticate(params[:password])

        if user.admin?
          session[:user_admin_id] = user.id
          redirect_to admin_root_path
        else
          session[:user_id] = user.id
          redirect_to user_path(current_user), notice: "Logged in!"
        end


      else
        flash.now.alert = "Email or password is invalid"
        render "new"
      end
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login', notice: "Logged out!"
  end

  def destroy_admin_user
    session[:user_admin_id] = nil
    redirect_to '/login', notice: "Logged out!"
  end
end
