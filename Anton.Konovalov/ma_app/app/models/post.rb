class Post < ApplicationRecord
  belongs_to :user
  has_many :images, as: :imageable
  scope :published, -> { where(is_published: true) }
end
