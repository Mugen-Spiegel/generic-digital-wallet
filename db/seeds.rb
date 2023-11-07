# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
#User Entity
User.create(name: "User2", email: "user2@gmail.com", password: "password1", password_confirmation: "password1")
#Bank entity
Team.create(name: "Bank", email: "bank@gmail.com", password: "password1", password_confirmation: "password1")
#ATM entity
Team.create(name: "Cash", email: "cash@gmail.com", password: "password1", password_confirmation: "password1")
#Stock Entity
Stock.create(name: "Stock1", email: "stock1@gmail.com", password: "password1", password_confirmation: "password1")

CashCredit.create(currency: "USD", amount: 999.00, reciever_id: User.first.id, status: true)
CashCredit.create(currency: "USD", amount: 100000.00, reciever_id: Team.first.id, status: true)
CashCredit.create(currency: "USD", amount: 100000.00, reciever_id: Team.last.id, status: true)
CashCredit.create(currency: "USD", amount: 999.00, reciever_id: Stock.first.id, status: true)
