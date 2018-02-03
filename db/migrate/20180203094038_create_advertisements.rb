class CreateAdvertisements < ActiveRecord::Migration[5.1]
  def change
    create_table :advertisements do |t|
      t.string :title
      t.string :description
      t.string :city

      t.timestamps
    end
  end
end
