class AddPrivateUserIdToAdvertisements < ActiveRecord::Migration[5.1]
  def change
    add_column :advertisements, :private_user_id, :integer
  end
end
