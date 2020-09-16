class AddCurrencyTpyeToAccount < ActiveRecord::Migration[6.0]
  def change
    add_column :accounts, :currency_type, :integer ,default: 0
  end
end
