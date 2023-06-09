class Pet < ApplicationRecord
  belongs_to :owner
  has_one_attached :avatar
  validates :owner_id, presence: true
  validates :name, presence: true
  validates :species, presence: true
  default_scope -> { order(created_at: :desc) }
end
