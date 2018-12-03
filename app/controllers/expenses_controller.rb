class ExpensesController < ApplicationController
  def index
    @tab = :expenses
    @categories = Category.all

    @current_month = params[:month].present? && params[:year].present? ? "#{params[:month]} #{params[:year]}" : Date.today.strftime('%B %Y')

    @expenses = Expense.per_month(@current_month)
    @expenses = @expenses.where(expense_type: params[:type]) if params[:type].present?
    @expenses = @expenses.joins(:category).merge(Category.where(name: params[:category])) if params[:category].present?

    @query_params = get_query_params_from_url(request)
  end

  def new
    @expense = Expense.new
  end

  def create
    @query_params = get_query_params_from_referer(request)
    @expense = Expense.new(expense_params)

    @expense.save
  end

  private

  def expense_params
    params.require(:expense).permit(:expense_type, :date, :concept, :category_id, :amount)
  end
end
