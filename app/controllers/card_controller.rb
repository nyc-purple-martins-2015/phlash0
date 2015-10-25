post '/cards/new' do
  card = Card.create(params[:card])
  @deck_id = card.deck_id
  erb :'/card/new'
end
