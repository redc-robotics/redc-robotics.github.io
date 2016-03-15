class Contact < ActiveRecord::Base
  validates :email, presence: true
  validates :name, presence: true
end
