class Account < ActiveRecord::Base
  belongs_to :language
  belongs_to :user

  default_scope order('id ASC')

  validates_presence_of :name, :language_id, :timezone, :user_id
  validates_uniqueness_of :name
end
