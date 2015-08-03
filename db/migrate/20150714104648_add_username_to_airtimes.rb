class AddUsernameToAirtimes < ActiveRecord::Migration
  def change
    add_column :airtimes, :username, :string
  end
end
