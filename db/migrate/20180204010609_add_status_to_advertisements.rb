class AddStatusToAdvertisements < ActiveRecord::Migration[5.1]
  def change
    add_column :advertisements, :status, :string
  end
end
