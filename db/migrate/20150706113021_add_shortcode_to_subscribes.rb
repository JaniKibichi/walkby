class AddShortcodeToSubscribes < ActiveRecord::Migration
  def change
    add_column :subscribes, :shortcode, :string
  end
end
