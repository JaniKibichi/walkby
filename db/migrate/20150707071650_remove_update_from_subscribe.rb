class RemoveUpdateFromSubscribe < ActiveRecord::Migration
  def change
    remove_column :subscribes, :update, :string
  end
end
