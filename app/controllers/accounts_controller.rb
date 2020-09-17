class AccountsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_account, only: [:show, :update, :destroy, :edit, :edit_form]

  def index
    @accounts = current_user.accounts.decorate
    @account = current_user.accounts.new.decorate

  end

  def new
  end

  def create
    @account = current_user.accounts.new(account_params).decorate

    respond_to do |format|
      if @account.save
        format.html { redirect_to accounts_path, notice: 'account was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @account.update(account_params)
        format.html { redirect_to accounts_path, notice: 'account was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end



  def account_params
    params.require(:account).permit(:name, :status, :currency_type)
  end

  def set_account
    @account = Account.find(params[:id])
  end
end
