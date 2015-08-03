class CreateBulks < ActiveRecord::Migration
  def change
    create_table :bulks do |t|

      t.timestamps null: false
    end
  end
end
