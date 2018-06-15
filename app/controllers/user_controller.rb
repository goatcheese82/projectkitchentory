class UserController < ApplicationController
  post "/users/sign_up" do
    user = User.new(first_name: params["first_name"], last_name: params["last_name"], username: params["username"], password: params["password"])
    user.save
    @inventory = Inventory.new(user_id: user.id, name: user.username)
    @inventory.save
    session[:id] = user.id
    redirect "/sessions/home"
  end
end
