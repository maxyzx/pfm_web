class TransactionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_transaction, only: [:show, :update, :destroy, :edit, :edit_form]

  def index
    @transaction=current_user.transactions
    @transaction = current_user.transactions.new

  end
  def create
    @transaction = current_user.transactions.new(transaction_params)

    respond_to do |format|
      if @transaction.save
        format.html { redirect_to transactions_path, notice: 'Transaction was successfully created.' }
      else
        format.html { render :new }
      end
    end


  end


  def transaction_params
    params.require(:transaction).permit(:name, :category , :amount)
  end

  def set_transaction
    @account = Account.find(params[:id])
  end
end