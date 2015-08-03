class AddApikeyToBulks < ActiveRecord::Migration
  def change
    add_column :bulks, :apikey, :string
  end
end
