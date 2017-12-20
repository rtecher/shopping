class Product < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_attached_file :image, styles: { small: "320x150#" ,slider: "800x300#" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
