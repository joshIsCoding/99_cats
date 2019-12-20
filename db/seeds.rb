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