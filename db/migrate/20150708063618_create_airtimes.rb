class CreateAirtimes < ActiveRecord::Migration
  def change
    create_table :airtimes do |t|
      t.string :status
      t.string :amount
      t.string :phoneNumber
      t.string :discount
      t.string :requestId

      t.timestamps null: false
    end
  end
end
