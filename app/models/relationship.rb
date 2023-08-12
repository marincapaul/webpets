class Relationship < ApplicationRecord
  belongs_to :follower, class_name: "Pet"
  belongs_to :followed, class_name: "Pet"
  
  validates :follower_id, presence: true
  validates :followed_id, presence: true
  
end
