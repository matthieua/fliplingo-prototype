class AccountsController < ApplicationController
  before_action :load_config
  def new
    @account   = Account.new
  end

  def create
    @account      = Account.new account_params
    @account.user = current_user

    if @account.save
      redirect_to flips_path
    else
      render :new
    end
  end


  private

  def account_params
    params.permit(:account => [:name, :timezone, :language_id, :user_id])[:account]
  end

  def load_config
    @languages = Language.all
    @timezones = Timezone.all
  end
end
