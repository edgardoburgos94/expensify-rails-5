Category.all.delete_all
Expense.all.delete_all

Category.create name: 'Car'
Category.create name: 'Bike'
Category.create name: 'Restaurants'
Category.create name: 'Bicycle'
Category.create name: 'Girlfriend'
Category.create name: 'Pizza'
Category.create name: 'Gas'

final_date = Date.today
initial_date = final_date - 6.month

(initial_date..final_date).each do |day|
  Category.all[rand(0..Category.all.size-1)].expenses.create(
    expense_type: rand(0..3),
    concept: "Nombre de gasto que no me pondré a pensar",
    amount: rand(20000..1000000),
    date: day
  )
end
