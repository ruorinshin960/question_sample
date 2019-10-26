class Article < ApplicationRecord
  has_many :comments
  belongs_to :user
  mount_uploader :image, ImagesUploader
  validates :content, presence: true, unless: :image?
end
