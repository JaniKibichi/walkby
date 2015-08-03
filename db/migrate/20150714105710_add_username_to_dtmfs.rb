class AddUsernameToDtmfs < ActiveRecord::Migration
  def change
    add_column :dtmfs, :username, :string
  end
end
