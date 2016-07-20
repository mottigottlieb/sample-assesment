class UserController < ApplicationController

  get '/signup' do
    erb :signup
  end

  get '/login' do
    erb :login
  end

  post '/signup' do
    user = User.create(:username => params[:username], :password => params[:password])
    if user.save
        session[:user_id] = user.id
      erb :dashboard
      redirect "/#{user.username}/dashboard"
      else
        "/"
      end

  end

  post '/login' do
      user = User.find_by(:username => params[:username])
      if user && user.authenticate(params[:password])
      session[:user_id] = user.id
        redirect "/#{user.username}/dashboard"
    else
      redirect "/"
    end
  end




  get '/logout' do
  session.clear
  "session cleared"
  end



  get '/:username/dashboard' do
    if logged_in?
      @user = User.find_by_id(session[:user_id])
      erb :dashboard
    else
      "not logged in"
    end
  end

end
