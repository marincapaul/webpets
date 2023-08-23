class Request < ApplicationRecord
  belongs_to :sender, class_name: "Pet"
  belongs_to :receiver, class_name: "Pet"
  validates :sender_id, presence: true
  validates :receiver_id, presence: true

  enum status: {pending: 0, accepted: 1, deleted:2}

end
