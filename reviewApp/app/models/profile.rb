class Profile < ApplicationRecord

has_many :reviews
mount_uploader :userPhoto, ImageUploader

end
