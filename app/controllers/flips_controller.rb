class FlipsController < ApplicationController
  def index
    @flips = current_user.flips
  end

  def new
    @flip = Flip.new
  end

  def create
    @flip      = Flip.new flip_params
    @flip.user = current_user

    debugger

    if @flip.save
      redirect_to flips_path
    else
      render :new
    end
  end

  private

  def flip_params
    params.permit(:flip => [:from, :to, :kind, :notification])[:flip]
  end
end

