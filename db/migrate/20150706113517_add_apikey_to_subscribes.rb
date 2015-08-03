class AddApikeyToSubscribes < ActiveRecord::Migration
  def change
    add_column :subscribes, :apikey, :string
  end
end
