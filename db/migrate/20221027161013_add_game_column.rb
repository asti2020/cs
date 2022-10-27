class AddGameColumn < ActiveRecord::Migration[6.1]
  def change
    add_column :games, :ongoing, :integer
  end
end
