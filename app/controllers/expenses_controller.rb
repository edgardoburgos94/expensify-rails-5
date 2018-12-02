class ExpensesController < ApplicationController
  def index
    @tab = :expenses
    @categories = Category.all
    @expenses = Expense.this_month
  end
end
