class AddUpdatetypeToSubscribe < ActiveRecord::Migration
  def change
    add_column :subscribes, :updatetype, :string
  end
end
