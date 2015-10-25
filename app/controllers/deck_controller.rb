get '/decks' do
  @decks = Deck.all
  erb :'decks/index'
end

get '/decks/:deck_id' do
  if logged_in?
    @round = Round.new(user_id: session[:user_id], deck_id: params[:deck_id])
    @round.save
  else
    @round = Round.new(deck_id: params[:deck_id])
    @round.save
  end

    @deck = @round.deck
    @cards = @deck.cards.to_a

    @cards.each do |card|
      Guess.create!(round_id: @round.id, card_id: card.id, is_correct: false, times_guessed: 0)
    end
    session[:round_id] = @round.id
    redirect to("/rounds/#{@round.id}")
end
