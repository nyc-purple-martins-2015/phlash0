get '/login' do
  erb :'/user/login'
end

post '/login' do
  @user = User.find_by(email: params[:user][:email])
  if @user.valid?
    if @user.password == params[:password]
      session[:user_id] = @user.id
      redirect '/'
    else
      erb :'/user/login'
    end
  else
    @errors = @user.errors.full_messages
    erb :login
  end
end

get '/logout' do

end

get '/signup' do
  erb :'user/signup'
end


post '/signup' do
  @user = User.new(params[:user])
  if @user.save
    session[:user_id] = @user.id
    redirect to('/deck')
  else
    erb :'user/signup'
  end
end


