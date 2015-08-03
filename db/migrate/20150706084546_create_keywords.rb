class CreateKeywords < ActiveRecord::Migration
  def change
    create_table :keywords do |t|
      t.string :from
      t.string :to
      t.string :text
      t.string :date
      t.string :smsId
      t.string :linkId

      t.timestamps null: false
    end
  end
end
