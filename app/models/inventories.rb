class Inventory < ActiveRecord::Base
  belongs_to :user
  has_many :things
end
