class ProfilesController < ApplicationController
  def show
    @current_user = User.where(email: 'mathias@betahaus.de').first
  end
end
