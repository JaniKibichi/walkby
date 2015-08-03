class AddBody2ToUssds < ActiveRecord::Migration
  def change
    add_column :ussds, :body2, :string
  end
end
