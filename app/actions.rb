# Homepage (Root path)
configure do
  enable :sessions
end

get '/' do
  erb :index
end 

get '/songs' do
  @songs = Song.all
  erb :'songs/index'
end

get '/songs/new' do
  erb :'songs/new'
end

post '/song_create' do
  # title = params[title]
  # binding.pry
  puts params[:author]
  puts params[:title]
  puts params[:url]
  Song.create(
  author: params[:author], 
  title: params[:title], 
  url: params[:url] 
  )
  redirect '/songs'
end

# get login
# create a new .erb login or w/e. 
# similar fields to our signup 

# post login
# within login.erb, we want to send back the email and password params
# once we sign up, we have a user / password available.
# with the parameters i need to check if this person exists and their password is correct 
# store a session - see notes. session[:id] = user.id 
# redirect to our index page. 

# get '/login' do
#   erb :login
# end

# post '/login' do
#   # binding.pry
#   if params[:username] == settings.username && params[:password] == settings.password 
#     session[:user] = params[:username] 
#     redirect to('/songs')
#   else
#     erb :login
#   end 
# end

# get '/logout' do
#   session.clear
#   redirect to('/login')
# end

get '/users/new' do
  erb :'/users/new'
end

post '/users/new' do
  @user = User.create(
    email: params[:email], 
    name: params[:name], 
    password: params[:password])
  if @user.save # if record persists, redirect to index page. 
    redirect '/songs'
    # erb :'songs/index'
  # else   
    # errors.add or put some custom shiet.
  end
  # User.create email: params[:email], name: params[:name], password: params[:password] 
  # redirect '/'
end