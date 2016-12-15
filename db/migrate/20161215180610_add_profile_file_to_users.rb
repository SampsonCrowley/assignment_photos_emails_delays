class AddProfileFileToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :profile_photo_local, :string
  end
end
