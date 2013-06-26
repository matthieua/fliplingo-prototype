class FlipsController < ApplicationController
  def index
    @flips = current_user.flips
  end
end
