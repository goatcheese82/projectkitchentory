class User < ActiveRecord::Base
  has_secure_password
  has_one :inventory
end

#User has one Inventory
#Inventory has many categories and things through categories
#categories belong to many inventories and things
#things have many categories

#User has one inventory
#inventory belongs to many things and has many things
#things belong to many inventories and have many inventories
