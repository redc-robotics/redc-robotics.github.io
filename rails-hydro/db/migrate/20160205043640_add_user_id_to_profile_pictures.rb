class AddUserIdToProfilePictures < ActiveRecord::Migration
  def change
    add_column :profile_pictures, :user_id, :integer
  end
end
