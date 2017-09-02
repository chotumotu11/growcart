# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Cart.destroy_all
Item.destroy_all
User.destroy_all
Brand.destroy_all
Subcategory.destroy_all
Category.destroy_all

#Loading Category data in the database.
Category.create! [
	{name: "Fruits/Veggies"},
	{name: "Meat/Fish"},
	{name: "Bread/Diary"},
	{name: "Beverages"},
	{name: "Groceries"}
]

Category.first.subcategories.create! [ 
	{name: "Fresh Fruits"},
	{name: "Fresh Veggies"},
	{name: "Fresh Sprouts"}
] 

Category.second.subcategories.create! [ 
	{name: "Fresh Meat"},
	{name: "Fresh Fish"},
	{name: "Fresh Chicken"}
] 

Category.third.subcategories.create! [ 
	{name: "Fresh Bread"},
	{name: "Fresh Milk"},
	{name: "Single tone milk"}
] 

Category.fourth.subcategories.create! [ 
	{name: "Beer"},
	{name: "Cold Drinks"},
	{name: "Tea"}
] 

Category.fifth.subcategories.create! [ 
	{name: "Egg"},
	{name: "Rice"},
	{name: "Wheat"}
] 


Category.first.subcategories.first.brands.create! [{name: "local"},
{name: "chinese"},
{name: "american"}]

Category.first.subcategories.second.brands.create! [{name: "local"},
{name: "chinese"},
{name: "brazilian"}]

Category.first.subcategories.third.brands.create! [{name: "swiss"},
{name: "punjab"},
{name: "arabian"}]


Category.second.subcategories.first.brands.create! [{name: "malda"},
{name: "chinese"},
{name: "buga"}]


Category.second.subcategories.second.brands.create! [{name: "local"},
{name: "Japanese"},
{name: "brazilian"}]

Category.first.subcategories.first.brands.first.items.create! [{title: "Cabbage", price: 20 , description: "A green vegetable"},
{title: "Egg Plant", price: 30 , description: "Fine blue plant"}]


Category.first.subcategories.first.brands.second.items.create! title: "bambo shoot" , price: 10 , description: "Chinese maal"

Category.second.subcategories.second.brands.third.items.create! [{title: "salmon" , price: 5 , description: "A good fish"},
{title: "brazilian fish", price: 40 , description: "A very good fish"}]


User.create! [{name: "Dipayan Deb", email: "chotumotu11@gmail.com", phone: 9883060084 , address: "FE 197 Salt Lake" , account_type: "normal" },
{name: "Deepak Tibrewal" , email: "Tibrewal@gmail.com", phone: 8999999999 , address: "Some Apartment" , account_type: "normal"} ]