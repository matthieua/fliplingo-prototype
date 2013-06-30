class Mention < ActiveRecord::Base
  belongs_to :translation
  belongs_to :reply, :class_name => "Translation"

  validates_presence_of :translation_id, :twitter_handle, :name, :reply_id
end
