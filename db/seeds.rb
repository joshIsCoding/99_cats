# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

cats = Cat.create([
   { name: "Sennacy", birth_date: "01/07/2015", color: "leopard", sex: "M", description: "I cherish this little panther." },
   { name: "Tabitha", birth_date: "10/02/2016", color: "tabby", sex: "F", description: "Charmed, I'm sure." },
   { name: "Willace", birth_date: "23/11/2017", color: "tortoiseshell", sex: "M", description: "Truly, an aristocat." },
])

cat_rental_requests = CatRentalRequest.create([
   { cat_id: 3, start_date: "05/01/2020", end_date: "10/01/2020"},
   { cat_id: 3, start_date: "01/01/2020", end_date: "5/01/2020"},
   { cat_id: 3, start_date: "06/01/2020", end_date: "7/01/2020"},
   { cat_id: 3, start_date: "07/01/2020", end_date: "11/01/2020"},
   { cat_id: 3, start_date: "10/01/2020", end_date: "15/01/2020"},
   { cat_id: 3, start_date: "11/01/2020", end_date: "15/01/2020"},
   { cat_id: 3, start_date: "1/01/2020", end_date: "11/01/2020"},
   { cat_id: 3, start_date: "1/01/2020", end_date: "3/01/2020"}
])