class CreatePickcalls < ActiveRecord::Migration
  def change
    create_table :pickcalls do |t|
      t.integer :isActive
      t.string :sessionId
      t.string :direction
      t.string :callerNumber
      t.string :destinationNumber
      t.string :dtmfDigits
      t.string :recordingUrl
      t.string :durationInSeconds
      t.string :currencyCode
      t.string :amount
      t.string :username
      t.string :apikey

      t.timestamps null: false
    end
  end
end
