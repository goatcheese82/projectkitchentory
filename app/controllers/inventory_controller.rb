class InventoryController < ApplicationController
  post "/inventory/add" do
    @thing = Thing.new(title: params[:title], description: params[:description], quantity: params[:quantity], inventory_id: current_user.id)
    @thing.save
    redirect "/sessions/home"
  end

  get "/inventory/add" do
    if logged_in?
      erb :'/inventory/add'
    else
      redirect "/sessions/log_in"
    end
  end

  get "/inventory/user_things" do
    if logged_in?
      @things = current_user.inventory.things.all
      erb :'inventory/inventory'
    else
      redirect "/sessions/log_in"
    end
  end

  get "/inventory/:id/edit" do
  end

  get "/inventory/:id/delete/" do
    if logged_in?
      @thing = Thing.find_by_id(params[:id])
      if @thing && @thing.inventory_id == current_user.inventory.id
        @thing.delete
      end
    else
      redirect "/login"
    end
  end

  helpers do
    def load_items
      @things = current_user.inventory.things.all
    end
  end
end
