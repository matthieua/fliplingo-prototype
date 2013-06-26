class FlipController < ApplicationController
  def index
    @flips = current_user.flips
  end
end
