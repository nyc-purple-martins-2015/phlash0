get '/rounds/:id' do

  @round = Round.find(session[:round_id])
  @guesses = @round.guesses.where(is_correct: false)
  @deck = @round.deck
  @cards = []
  @guesses.each do |guess|
      @cards << Card.where(id: guess[:card_id])
  end

  if @cards == []
    if logged_in?
      erb :'rounds/stats'
    else
      redirect '/'
    end
  else
    @card = @cards.sample.first
    erb :'rounds/show'
  end

end

post '/rounds/:id' do
  @guess = Guess.where(round_id: params[:id]).where(card_id: params[:card])
  @guess.first[:is_correct] = params[:is_correct]
  @guess.first[:times_guessed] += 1
  @guess.first.save
  redirect "/rounds/#{params[:id]}"
end
