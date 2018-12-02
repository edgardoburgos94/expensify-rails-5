class Expense < ApplicationRecord
  belongs_to :category

  enum expense_type: [ :Purchase, :Transfer, :Payment, :Withdrawal]

  scope :this_month, -> { where(date: Date.today.beginning_of_month..Date.today.end_of_month)}

  def self.per_month(date)
    date = Date.new(date.split[1].to_i, Date::MONTHNAMES.index(date.split[0]))
    Expense.where(date: date.beginning_of_month..date.end_of_month)
  end
end
