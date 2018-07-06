class UserController < ApplicationController
  get "/users/sign_up" do
    if !logged_in?
      erb :'sessions/sign_up'
    else
      redirect "/sessions/home"
    end
  end

  post "/users/sign_up" do
    user = User.new(first_name: params["first_name"], last_name: params["last_name"], username: params["username"], password: params["password"])
    if user.valid?
      user.save
      @inventory = Inventory.new(user_id: user.id, name: user.username)
      @inventory.save
      session[:id] = user.id
      redirect "/sessions/home"
    else
      flash[:message] = "Invalid Username or Password"
      redirect "/users/sign_up"
    end
  end

  helpers do
    def load_users_usernames
      @users = User.all
    end
  end
end
