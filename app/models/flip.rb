class Flip < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :from, :to, :kind, :user_id
end
