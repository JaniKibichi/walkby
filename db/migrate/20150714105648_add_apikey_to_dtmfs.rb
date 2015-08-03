class AddApikeyToDtmfs < ActiveRecord::Migration
  def change
    add_column :dtmfs, :apikey, :string
  end
end
