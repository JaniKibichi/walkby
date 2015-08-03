class AddNumberToSubscribes < ActiveRecord::Migration
  def change
    add_column :subscribes, :number, :string
  end
end
