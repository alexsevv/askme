class AddUserHeaderColor < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :header_color, :string
  end
end
