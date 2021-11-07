class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :likes
  has_many :fans, through: :likes, source: :user
  has_many :comments

  scope :by_buddies_of, ->(user) { joins("INNER JOIN connections ON connections.user_id = posts.author_id").where(connections: { buddy_id: user.id, accepted: true } ) }
end
