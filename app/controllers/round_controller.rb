get '/rounds/:id' do

  # @guesses = Guess.where(round_id: session[:round_id]).where(is_correct: false)
  @round = Round.find(session[:round_id])
  @guesses = @round.guesses.where(is_correct: false)
  @deck = @round.deck
  @cards = []
  @guesses.each do |guess|
      @cards << Card.where(id: guess[:card_id])
  end

  if @cards == []
    erb :'rounds/stats'
  else
    @card = @cards.sample.first
    erb :'rounds/show'
  end

end

post '/rounds/:id' do
  @guess = Guess.where(round_id: params[:id]).where(card_id: params[:card])
  # if params[:is_correct] == "false"
  #   @status = false
  # else
  #   @status = true
  # end
  @guess.first[:is_correct] = params[:is_correct]
  @guess.first[:times_guessed] += 1
  @guess.first.save
  redirect "/rounds/#{params[:id]}"
end
