class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :connections
  has_many :buddies, -> { joins(:connections).where(connections: { accepted: true }) }, through: :connections
  has_many :posts, foreign_key: :author_id, inverse_of: :author, dependent: :destroy
end
