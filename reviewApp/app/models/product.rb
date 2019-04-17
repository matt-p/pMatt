class Product < ApplicationRecord

has_many :reviews
mount_uploader :prodPhoto, ImageUploader
end
