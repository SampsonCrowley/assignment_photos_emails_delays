class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.binary :profile_photo_data
      t.string :profile_photo_type
      t.string :profile_photo_name

      t.timestamps
    end
  end
end
