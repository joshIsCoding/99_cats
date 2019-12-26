# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create( [
   { user_name: "bonable", password: "test"},
   { user_name: "serenable", password: "seren_test"},
   { user_name: "charisable", password: "charis"}
])

cats = Cat.create([
   { name: "Sennacy", birth_date: "01/07/2015", color: "leopard", sex: "M", description: "I cherish this little panther.", owner: users[0] },
   { name: "Tabitha", birth_date: "10/02/2016", color: "tabby", sex: "F", description: "Charmed, I'm sure.", owner: users[2] },
   { name: "Willace", birth_date: "23/11/2017", color: "tortoiseshell", sex: "M", description: "Truly, an aristocat.", owner: users[1] }
])

cat_rental_requests = CatRentalRequest.create([
   { cat_id: 3, start_date: "05/01/2020", end_date: "10/01/2020", requester: users[0]},
   { cat_id: 3, start_date: "01/01/2020", end_date: "5/01/2020", requester: users[2]},
   { cat_id: 2, start_date: "06/01/2020", end_date: "7/01/2020", requester: users[2]},
   { cat_id: 3, start_date: "07/01/2020", end_date: "11/01/2020", requester: users[2]},
   { cat_id: 1, start_date: "10/01/2020", end_date: "15/01/2020", requester: users[1]},
   { cat_id: 2, start_date: "11/01/2020", end_date: "15/01/2020", requester: users[0]},
   { cat_id: 1, start_date: "1/01/2020", end_date: "11/01/2020", requester: users[2]},
   { cat_id: 2, start_date: "1/01/2020", end_date: "3/01/2020", requester: users[0]}
])