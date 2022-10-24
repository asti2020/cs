class CreateMatchups < ActiveRecord::Migration[6.1]
  def change
    create_table :matchups do |t|
      t.integer :user_id
      t.integer :game_id
      t.string :side
    end
  end
end
