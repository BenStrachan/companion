class CreateNotifications < ActiveRecord::Migration[5.1]
  def change
    create_table :notifications do |t|
      t.text :content
      t.integer :user_id, index: true
      t.text :link

      t.timestamps
    end
  end
end
