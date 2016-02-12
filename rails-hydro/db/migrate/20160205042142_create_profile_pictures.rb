class CreateProfilePictures < ActiveRecord::Migration
  def change
    create_table :profile_pictures do |t|
      t.attachment :image

      t.timestamps null: false
    end
  end
end
