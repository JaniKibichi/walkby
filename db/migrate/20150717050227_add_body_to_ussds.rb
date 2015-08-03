class AddBodyToUssds < ActiveRecord::Migration
  def change
    add_column :ussds, :body, :string
  end
end
