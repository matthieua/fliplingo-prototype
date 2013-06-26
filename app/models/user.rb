class User < ActiveRecord::Base
  has_many :flips
  has_many :accounts
end
