class Photo < ApplicationRecord
  validates :title , :user, :category_id , presence: true
  belongs_to :category
  has_one_attached :image
  validate :image_validation

  def image_validation
    if image.attached?
      if !image.blob.content_type.starts_with?('image/')
        raise "Error"
      end
    else
      raise "Error"
    end
  end
end
