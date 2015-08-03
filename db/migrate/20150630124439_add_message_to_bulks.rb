class AddMessageToBulks < ActiveRecord::Migration
  def change
    add_column :bulks, :message, :string
  end
end
