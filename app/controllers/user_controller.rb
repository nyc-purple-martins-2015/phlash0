get '/login' do
  erb :'/user/login'
end

post '/login' do
  user_params = params[:user]
  user = User.find_by(email: user_params[:email])
  if user && user.password == user_params[:password]
    session[:user_id] = user.id
    redirect '/'
  else
    redirect '/login'
  end
end

get '/logout' do
  session.clear
  redirect '/'
end

get '/signup' do
  erb :'user/signup'
end


post '/signup' do
  user = User.new(params[:user])
  if user.save
    session[:user_id] = user.id
    redirect to('/decks')
  else
    @errors = user.errors.full_messages
    erb :'user/signup'
  end
end

get '/user/:user_id/user_page' do
  erb :'/user/user_page'
end



