class AddFieldsToAccounts < ActiveRecord::Migration[6.0]
  def change
    add_column :accounts, :status, :boolean, default: true
  end
end
