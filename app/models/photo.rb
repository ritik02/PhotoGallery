class Photo < ApplicationRecord
  validates :title , :user, :category_id , presence: true
  belongs_to :category
  has_one_attached :image
end
