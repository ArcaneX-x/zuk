class AddSaltToUserAndAdmin < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :salt, :string
    add_column :admins, :salt, :string
  end
end
