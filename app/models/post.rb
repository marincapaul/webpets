class Post < ApplicationRecord
  belongs_to :pet
  default_scope -> { order(created_at: :desc) }
  has_many_attached :media
  has_many :comments
  validates :pet_id, presence: true
  validates :content, presence: true
end
