class TransactionUpdateMailer < ApplicationMailer
  default :from => 'no-reply@example.com'

  def update_transaction(transaction_id, email)
    @transaction = Transaction.find_by id: transaction_id
    mail(to: email,
      subject: 'Transaction change'
    )
  end
end
