class ProfilePicture < ActiveRecord::Base
  has_attached_file :image, styles: { profile: "150x150" }
  belongs_to :user
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
