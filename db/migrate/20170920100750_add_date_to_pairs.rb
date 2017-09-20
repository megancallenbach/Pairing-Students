class AddDateToPairs < ActiveRecord::Migration[5.1]
  def change
    add_column :pairs, :date, :date
  end
end
