require_relative 'config/environment'

class App < Sinatra::Base
  
  configure do
    enable :sessions
    set :session_secret, "secret"
    set :views, "views"
  end
  
  get '/' do
    erb :index
  end
  
  get '/checkout' do
    erb :checkout
  end
  
  post '/checkout' do
    p params[:item]
    @session[:item] = params[:item]
    redirect '/checkout'
  end

end