require 'sinatra'
require 'sinatra/activerecord'
require 'bcrypt'
require 'sinatra/flash'

require_relative 'models/movie'
require_relative 'models/review'
require_relative 'models/user'

enable :sessions
register Sinatra::Flash

get '/' do
  erb :index
end

get '/users/:id' do
  @user = User.find(params[:id])
  erb :user_profile
end

get '/register' do
  erb :register
end

post '/register' do
  @user = User.new(
    username: params[:username],
    email: params[:email],
    password: params[:password]
  )
  if @user.save
    redirect '/login'
  else
    erb :register
  end
end

get '/login' do
  erb :login
end

post '/login' do
  @user = User.find_by(email: params[:email])
  if @user && @user.authenticate(params[:password])
    session[:user_id] = @user.id
    redirect '/'
  else
    flash[:error] = "Invalid username or password" # Set flash error message
    erb :login
  end
end

get '/logout' do
  session.clear
  redirect '/'
end

helpers do
  def logged_in?
    !session[:user_id].nil? # Check if the user's ID is stored in the session
  end

  def current_user
    if logged_in?
      @current_user ||= User.find(session[:user_id]) # Fetch the current user from the database
    end
  end
end
