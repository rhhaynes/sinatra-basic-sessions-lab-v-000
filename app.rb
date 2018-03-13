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
    @item = session.delete(:item)
    erb :checkout
  end
  
  post '/checkout' do
    session[:item] = params[:item]
    redirect '/checkout'
  end

end