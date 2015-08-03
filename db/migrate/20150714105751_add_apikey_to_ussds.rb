class AddApikeyToUssds < ActiveRecord::Migration
  def change
    add_column :ussds, :apikey, :string
  end
end
