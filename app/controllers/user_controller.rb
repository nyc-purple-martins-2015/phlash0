get '/login' do

end

post '/login' do

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


