class AddUsernameToSubscribes < ActiveRecord::Migration
  def change
    add_column :subscribes, :username, :string
  end
end
