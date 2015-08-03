class AddApikeyToAirtimes < ActiveRecord::Migration
  def change
    add_column :airtimes, :apikey, :string
  end
end
