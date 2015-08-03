class AddStatusToBulks < ActiveRecord::Migration
  def change
    add_column :bulks, :status, :string
  end
end
