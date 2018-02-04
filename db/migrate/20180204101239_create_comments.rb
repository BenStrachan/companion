class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.text :content
      t.integer :user_id, index: :true
      t.integer :advertisement_id, index: :true
      t.boolean :is_private, default: :false
      t.timestamps
    end
  end
end
