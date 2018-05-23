class Photo < ApplicationRecord
  validates :title , :user, :category_id , presence: true
end
