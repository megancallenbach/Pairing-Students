class AddFieldsToPairs < ActiveRecord::Migration[5.1]
  def change
    add_column :pairs, :student1, :string
    add_column :pairs, :student2, :string
  end
end
