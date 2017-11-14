Demo: http://growcart.herokuapp.com/

The code here is almost same as the final submitted project. Some major changes include proper indentation.
### README

This is a full fleged grocery shopping system. It meets the following needs 

Online Grocery Shop -

Users should be able to see various types of categories, various types of sub-categories under each category and items of each sub category under various brands.

In order to do this -

Users will be able to add / edit various types of categories like - Fruits/Veggies, Meat/Fish, Bread/Dairy, Beverages, Groceries, etc.

Users will also be able to list, view & delete the categories when required.

Users will be able to add / edit various types of subcategories under each category like - Under category Fruits/Veggies - Fresh fruits, Fresh vegetables, Cuts & sprouts, etc.
           Under category Beverages - Soft drinks, tea & coffee, energy/health drinks, etc.

Users will also be able to list, view & delete the subcategories when required.

Users will be able to add / edit various brands of items under each subcategories like - Britannia, Nestle, Tropicana, Hindustan Unilever, ITC, etc.

Users will also be able to list, view & delete the brands when required.

Extension: - 

Users should be able to sign in the system if he / she does not have any account and will be required to provide name, email id & password while creating account for the first time.

If the user is an existing user then he / she will be able to login the system.

While logging in the system if the user email / password provided is wrong then it will show appropriate error messages.

The system should display the name of the user on the upper right corner of the page when that specific user logs in and will show it as long as the user stays logged in.

Admin users can add new items, details & categories.

Admin users should also have access to edit / delete the items, item details & categories if required.

Existing users who have logged in should be able to select items and attach them to cart and complete a checkout (no need to do any payment integration - assume COD).

Existing users should be able to see the orders they have placed and their details.



* Ruby version - 5.1.4

* System dependencies - run "bundle install" 

* Configuration - No idea 

* Database creation - run "rails db:migrate"

* Database initialization - run "rails db:seed"

* Deployment instructions

Clone the repository

run "bundle install"

run "rails db:migrate"

run "rails db:seed" - optional

run "rails s"

Default Admin Account details

Username : admin@admin.com
password : admin