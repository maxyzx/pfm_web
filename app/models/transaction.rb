class Transaction < ApplicationRecord
  belongs_to :account
  validates :name, presence: true
  validates :creatgory, presence: true
  validates :name, presence: true

end
