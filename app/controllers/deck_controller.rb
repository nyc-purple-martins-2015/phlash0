get '/decks' do
  @decks = Deck.all
  erb :'decks/index'
end

get '/decks/:deck_id' do

end

get '/decks/:deck_id/cards/:id/question' do
  @round = Round.new
  @deck = Deck.find(params[:deck_id])
  @cards = @deck.cards.shuffle
  @card = @cards.shift
  @question = @card.question
  erb :'decks/card_question'
end

get '/decks/:deck_id/cards/:id/answer' do
  erb :'decks/card_answer'
end

post '/' do

end

get '/' do

end

get '/' do
  erb :''
end

