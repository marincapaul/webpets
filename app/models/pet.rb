class Pet < ApplicationRecord
  belongs_to :owner

  has_one_attached :avatar
  has_many_attached :docs
  enum gender: { male: 0, female: 1, other: 2 }
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
  has_many :active_requests, class_name: "Request",
                            foreign_key: "sender_id",
                            dependent: :destroy
  has_many :passive_requests, class_name: "Request",
                            foreign_key: "receiver_id",
                            dependent: :destroy
  has_many :requesting, through: :active_requests, source: :receiver
  has_many :requesters, through: :passive_requests, source: :sender

  validates :owner_id, presence: true
  validates :name, presence: true
  validates :species, presence: true

  default_scope -> { order(created_at: :desc) }

  

  def feed
    following_ids = "SELECT followed_id FROM relationships
                         WHERE follower_id = :pet_id"
    Post.where("pet_id IN (#{following_ids}) 
                    OR pet_id = :pet_id", pet_id: id)
  end

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

  def request(other_pet)
    requesting << other_pet
  end

  def unrequest(other_pet)
    requesting.delete(other_pet)
  end

  def requesting?(other_pet)
    requesting.include?(other_pet)
  end

end
