class AddTextToUssds < ActiveRecord::Migration
  def change
    add_column :ussds, :text, :string
  end
end
