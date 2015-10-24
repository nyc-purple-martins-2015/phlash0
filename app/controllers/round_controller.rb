get '/rounds/:id' do

  # @guesses = Guess.where(round_id: params[:round_id]).where(is_correct: false)
  round = Round.find(session[:round_id])
  @guesses = round.guesses.where(is_correct: false)
  binding.pry
  @cards = []
  @guesses.each do |guess|
      @cards << Card.where(id: guess[:card_id])
  end

  if @cards == []
    erb :'rounds/stats'
  else
    @card = @cards.sample
    erb :'rounds/display'
  end

end
