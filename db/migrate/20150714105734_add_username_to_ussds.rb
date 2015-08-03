class AddUsernameToUssds < ActiveRecord::Migration
  def change
    add_column :ussds, :username, :string
  end
end
