class SessionController < ApplicationController
  get "/sessions/sign_up" do
    if !logged_in?
      erb :'sessions/sign_up'
    else
      redirect "/sessions/home"
    end
  end

  get "/sessions/log_in" do
    if logged_in?
      redirect "/sessions/home"
    else
      erb :'sessions/log_in'
    end
  end

  post "/sessions/log_in" do
    @user = User.find_by(:username => params[:username])
    if @user && @user.authenticate(params[:password])
      session[:id] = @user.id
      redirect "/sessions/home"
    else
      redirect "/sessions/log_in"
    end
  end

  get "/sessions/home" do
    if logged_in?
      @user = User.find(session[:id])
      @inventory = Inventory.find_by(:user_id => @user.id)
      erb :'sessions/home'
    else
      redirect "/sessions/log_in"
    end
  end

  get "/sessions/logout" do
    session.clear
    erb :index
  end
end
