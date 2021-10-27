class Connection < ApplicationRecord
  belongs_to :user
  belongs_to :buddy, class_name: "User"

  after_create :create_inverse

  def create_inverse
    self.class.create(user_id: buddy.id, buddy_id: user.id)
  end

  validates_uniqueness_of :user_id, scope: :buddy_id
end
