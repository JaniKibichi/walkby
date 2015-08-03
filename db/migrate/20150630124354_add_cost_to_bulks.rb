class AddCostToBulks < ActiveRecord::Migration
  def change
    add_column :bulks, :cost, :string
  end
end
