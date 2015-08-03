class CreateKeysalls < ActiveRecord::Migration
  def change
    create_table :keysalls do |t|

      t.timestamps null: false
    end
  end
end
