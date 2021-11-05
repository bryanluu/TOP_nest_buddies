class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :likes
  has_many :fans, through: :likes, source: :user
  has_many :comments
end
