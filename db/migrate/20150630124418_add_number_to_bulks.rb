class AddNumberToBulks < ActiveRecord::Migration
  def change
    add_column :bulks, :number, :string
  end
end
