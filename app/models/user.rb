class User < ActiveRecord::Base
  validates :username, uniqueness: true
  validates_presence_of :first_name, :last_name, :username, :password
  has_secure_password
  has_one :inventory
  has_many :things, through: :inventory
end
