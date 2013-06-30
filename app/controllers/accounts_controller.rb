class AccountsController < ApplicationController
  def new
    load_config
    @account = Account.new
  end

  def create
    load_config
    @account      = Account.new account_params
    @account.user = current_user

    if @account.save
      redirect_to flips_path
    else
      render :new
    end
  end

  def show
    load_account
    @translations = Translation.where(account_id: @account.id, reply: false).order('created_at DESC')
    @mentions = Translation.where(account_id: @account.id, reply: true).order('created_at DESC')
  end

  def edit
    load_config
    load_account
  end

  def update
    load_account

    if @account.update_attributes(account_params)
      redirect_to account_path(@account)
    else
      render :edit
    end
  end

  def destroy
    load_account
    @account.destroy_flips
    @account.destroy

    redirect_to flips_path
  end

  def reconnect
    load_account
    redirect_to edit_account_path(@account)
  end


  private

  def load_account
    @account = Account.find params[:id]
  end

  def account_params
    params.permit(:account => [:name, :timezone, :language_id, :user_id])[:account]
  end

  def load_config
    @languages = Language.all
    @timezones = Timezone.all
  end
end
