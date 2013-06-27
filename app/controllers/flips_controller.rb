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

    if @flip.save
      redirect_to flips_path
    else
      render :new
    end
  end

  def edit
    load_flip
  end

  def update
    load_flip
    if @flip.update_attributes(flip_params)
      redirect_to flips_path
    else
      render :edit
    end
  end

  def activity
    load_flip
  end

  private

  def flip_params
    params.permit(:flip => [:from, :to, :kind, :notification, :instructions])[:flip]
  end

  def load_flip
    @flip = Flip.find params[:id]
  end
end
