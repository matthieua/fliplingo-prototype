class MentionsController < ApplicationController
  def create
    mention = Mention.new mention_params
  end

  private

  def mention_params
    params.permit(:mention => [:translation_id, :twitter_handle, :name, :reply_id])[:mention]
  end
end
