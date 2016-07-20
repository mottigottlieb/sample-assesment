require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "dont_tell_anyone"
  end


  get '/' do
    erb :welcome
  end



# controller for individual username dashboard



        #helper for sign in
        helpers do
        def logged_in?
        !!session[:user_id]
      end

      def current_user
        User.find(session[:id])
      end
    end

end
