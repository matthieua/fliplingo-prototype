class Account < ActiveRecord::Base
  belongs_to :language
  belongs_to :user

  default_scope order('id ASC')
end
