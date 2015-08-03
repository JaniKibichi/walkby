class CreateUssds < ActiveRecord::Migration
  def change
    create_table :ussds do |t|
      t.string :sessionId
      t.string :serviceCode
      t.string :phoneNumber

      t.timestamps null: false
    end
  end
end
