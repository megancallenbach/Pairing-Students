class AddPairToUsers < ActiveRecord::Migration[5.1]
  def change
    add_reference :users, :pair, foreign_key: true
  end
end
