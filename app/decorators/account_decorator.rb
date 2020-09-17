class AccountDecorator < Draper::Decorator
  delegate_all

  def balance
    deposits = transactions.deposits
    expenses = transactions.expenses
    deposits.sum(&:amount) - expenses.sum(&:amount)
  end

end
