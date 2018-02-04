class CreateAdvertisementsUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :advertisements_users do |t|
      t.integer :user_id, index: true
      t.integer :advertisement_id, index: true
    end
  end
end
