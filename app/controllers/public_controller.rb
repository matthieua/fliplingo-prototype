class PublicController < ApplicationController
  def home
    redirect_to 'http://localhost:3001/'
  end

  def upgrade
  end

  def help
  end

end
