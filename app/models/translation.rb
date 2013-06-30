class Translation < ActiveRecord::Base
  belongs_to :account
  has_many :mentions, :foreign_key => 'reply_id', :class_name => "Mention"


  validates_presence_of :account_id, :source, :source_language, :language, :kind, :status
  validates_inclusion_of :kind, in: %w|computer human  none|
  validates_inclusion_of :status, in: %w|processing processed published|
end
