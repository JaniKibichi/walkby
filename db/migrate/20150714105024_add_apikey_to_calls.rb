class AddApikeyToCalls < ActiveRecord::Migration
  def change
    add_column :calls, :apikey, :string
  end
end
