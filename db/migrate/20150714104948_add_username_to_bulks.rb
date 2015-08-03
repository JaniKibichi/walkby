class AddUsernameToBulks < ActiveRecord::Migration
  def change
    add_column :bulks, :username, :string
  end
end
