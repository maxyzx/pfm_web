class Transaction < ApplicationRecord
  belongs_to :account
  validates :name, presence: true
  scope :deposits, -> { where transaction_type: 0 }
  scope :expenses, -> { where transaction_type: 1 }

end
