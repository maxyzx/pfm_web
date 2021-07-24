class Transaction < ApplicationRecord
  belongs_to :account
  # validates :name, :category, presence: true
  validates :name, :category, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }

  validates :amount, numericality: true

  scope :deposits, -> { where transaction_type: 0 }
  scope :expenses, -> { where transaction_type: 1 }

end
