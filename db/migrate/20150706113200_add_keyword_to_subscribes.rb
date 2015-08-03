class AddKeywordToSubscribes < ActiveRecord::Migration
  def change
    add_column :subscribes, :keyword, :string
  end
end
