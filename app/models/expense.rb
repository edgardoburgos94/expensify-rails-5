class Expense < ApplicationRecord
  belongs_to :category

  enum expense_type: [ :Purchase, :Transfer, :Payment, :Withdrawal]

  scope :this_month, -> { where(date: Date.today.beginning_of_month..Date.today.end_of_month)}
end
