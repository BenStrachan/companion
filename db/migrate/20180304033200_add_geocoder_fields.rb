class AddGeocoderFields < ActiveRecord::Migration[5.1]
  def change
    add_column :advertisements, :latitude, :float
    add_column :advertisements, :longitude, :float

    add_column :users, :address, :string
    add_column :users, :latitude, :float
    add_column :users, :longitude, :float
  end
end
