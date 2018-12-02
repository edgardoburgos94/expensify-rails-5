module ExpensesHelper
  def transactions_types
    Expense.expense_types.keys
  end

  def total_expenses_amount(expenses)
    expenses.sum(:amount)
  end

  def average_expenses_amount(expenses)
    expenses.average(:amount)
  end

  def last_twelve_months
    (0..12).map{ |i| (Date.today - i.month).strftime("%B %Y") }
  end
end
