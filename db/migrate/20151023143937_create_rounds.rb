class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.integer :user_id
      t.integer :deck_id, null: false
      t.integer :num_first_guesses_correct
      t.integer :num_guesses_made

      t.timestamps null: false
    end
  end
end
