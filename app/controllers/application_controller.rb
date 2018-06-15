class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, "public"
    set :views, "app/views"
    enable :sessions
    set :session_secret, "App"
  end

  get "/" do
    if logged_in?
      redirect "/sessions/home"
    else
      erb :index
    end
  end

  helpers do
    def current_user
      @current_user ||= User.find_by(:id => session[:id]) if session[:id]
    end

    def logged_in?
      !!current_user
    end
  end
end
