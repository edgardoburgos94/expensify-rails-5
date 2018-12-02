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

  def type_query(params, type)
    query_params = { type: type }
    query_params.merge!({month: params["month"][0].to_s}) if params["month"].present?
    query_params.merge!({year: params["year"][0].to_s}) if params["year"].present?
    query_params.merge!({category: params["category"][0].to_s}) if params["category"].present?

    return query_params
  end

  def category_query(params, category)
    query_params = { category: category }
    query_params.merge!({month: params["month"][0].to_s}) if params["month"].present?
    query_params.merge!({year: params["year"][0].to_s}) if params["year"].present?
    query_params.merge!({type: params["type"][0].to_s}) if params["type"].present?

    return query_params
  end

  def date_query(params, month)
    query_params = { year: month.split[1], month: month.split[0] }
    query_params.merge!({type: params["type"][0].to_s}) if params["type"].present?
    query_params.merge!({category: params["category"][0].to_s}) if params["category"].present?

    return query_params
  end
end
