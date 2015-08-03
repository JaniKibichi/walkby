class AddMessageIdToBulks < ActiveRecord::Migration
  def change
    add_column :bulks, :message_id, :string
  end
end
