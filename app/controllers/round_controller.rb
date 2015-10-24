get '/rounds/:id' do

  # @guesses = Guess.where(round_id: session[:round_id]).where(is_correct: false)
  round = Round.find(session[:round_id])
  @guesses = round.guesses.where(is_correct: false)
  @deck = round.deck
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
