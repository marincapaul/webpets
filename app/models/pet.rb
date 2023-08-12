class Pet < ApplicationRecord
  belongs_to :owner

  has_one_attached :avatar
  has_many :posts, dependent: :destroy
  has_many :comments
  has_many :active_relationships, class_name: "Relationship",
                                  foreign_key: "follower_id",
                                  dependent: :destroy
                          
  has_many :passive_relationships, class_name: "Relationship",
                                  foreign_key: "followed_id",
                                  dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  validates :owner_id, presence: true
  validates :name, presence: true
  validates :species, presence: true

  default_scope -> { order(created_at: :desc) }


  # Follows a pet.
  def follow(other_pet)
    following << other_pet
  end

  # Unfollows a pet.
  def unfollow(other_pet)
    following.delete(other_pet)
  end
  
  # Returns true if the current pet is following the other pet.
  def following?(other_pet)
    following.include?(other_pet)
  end

end
