class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :question, null: false
      t.string :answer, null: false
      t.integer :deck_id
      t.integer :guess_count, :default => 0
      t.boolean :is_correct, :default => false

      t.timestamps null: false
    end
  end
end
