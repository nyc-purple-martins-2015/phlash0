class CreateGuesses < ActiveRecord::Migration
  def change
  	create_table :guesses do |t|
  		t.integer :round_id
  		t.integer :card_id
  		t.boolean :is_correct, :default => false
  		t.integer :times_guessed, :default => 0
  	end
  end
end
