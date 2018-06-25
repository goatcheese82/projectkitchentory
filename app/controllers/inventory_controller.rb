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

  get "/inventory/:id" do
    @thing = Thing.find_by_id(params[:id])
    erb :'/inventory/show'
  end

  get "/inventory/:id/edit" do
    if logged_in?
      @thing = Thing.find_by_id(params[:id])
      if @thing.inventory_id == current_user.inventory.id
        erb :'/inventory/edit'
      else
        flash[:message] = "You do not have access to edit that item."
        redirect "/inventory/user_things"
      end
    end
  end

  post "/inventory/:id/edit" do
    if logged_in?
      if params[:title].empty? || params[:quantity].empty? || params[:description].empty?
        redirect "/inventory/#{params[:id]}/edit"
      else
        @thing = Thing.find_by_id(params[:id])
        if @thing && @thing.inventory_id == current_user.inventory.id
          if @thing.update(title: params[:title], description: params[:description], quantity: params[:quantity])
            flash[:message] = "Item Updated"
            redirect "/inventory/user_things"
          else
            redirect "/inventory/#{@thing.id}/edit"
          end
        else
          redirect "/sessions/home"
        end
      end
    else
      redirect "/sessions/log_in"
    end
  end

  delete "/inventory/:id/delete" do
    if logged_in?
      @thing = Thing.find_by_id(params[:id])
      if @thing && @thing.inventory_id == current_user.inventory.id
        @thing.delete
        flash[:message] = "Item Deleted"
      end

      redirect "/inventory/user_things"
    else
      redirect "/login"
    end
  end

  helpers do
    def load_items
      @things = current_user.inventory.things.all
    end
  end

  #a bit of cleanup

  get "/inventory" do
    redirect "/inventory/user_things"
  end
end
