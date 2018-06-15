class User < ActiveRecord::Base
  has_secure_password
  has_one :inventory
  has_many :things, through: :inventory
end
