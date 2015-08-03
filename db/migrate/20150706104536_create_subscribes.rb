class CreateSubscribes < ActiveRecord::Migration
  def change
    create_table :subscribes do |t|
      t.string :status
      t.string :description

      t.timestamps null: false
    end
  end
end
