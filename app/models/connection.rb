class Connection < ApplicationRecord
  belongs_to :user
  belongs_to :buddy, class_name: "User"

  def create_inverse
    self.class.create(user_id: buddy.id, buddy_id: user.id, accepted: accepted)
  end

  validates_uniqueness_of :user_id, scope: :buddy_id

  scope :requests_for, -> (user_id) { where(buddy_id: user_id, accepted: false) }
end
