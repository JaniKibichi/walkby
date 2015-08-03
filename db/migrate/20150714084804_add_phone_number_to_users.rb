class AddPhoneNumberToUsers < ActiveRecord::Migration
  def change
    add_column :users, :phone_Number, :string
  end
end
