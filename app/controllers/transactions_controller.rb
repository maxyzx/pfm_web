class TransactionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_transaction, only: [:show, :update, :destroy, :edit, :edit_form]

  def index
    @transactions = current_user.transactions
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

  def update
    respond_to do |format|
      if @transaction.update(transaction_params)
        TransactionUpdateMailer.update_transaction(
          @transaction.id,
          current_user.email
        ).deliver_later

        # deliver_later
        # deliver_now

        format.html { redirect_to transactions_path, notice: 'Transaction was successfully updated.'}
      else
        format.html { render :show }
      end
    end
  end



  def transaction_params
    params.require(:transaction).permit(:name, :category , :amount ,:account_id,:transaction_type)
  end

  def set_transaction
    @transaction = Transaction.find(params[:id])
  end
end