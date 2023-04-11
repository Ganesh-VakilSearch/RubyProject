# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# "name"
#     t.string "regno"
#     t.string "email"
#     t.string "phonenumber"
#     t.string "address"
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false
#     t.string "dept"
#     t.date "date_of_birth
Student.create(
name:'sam',
regno:'3' ,
email:'samu@gmail.com',
phonenumber:'9876543212',
dept:'ECE',
date_of_birth:'9/9/2022'
)

# 20.times do |i|
#     puts 'Creating Student #{i+1}'
#     Student.create(
#         name:'Student #{i+1}',
# regno:'#{i+1}' ,
# email:'samu#{i+1}@gmail.com',
# phonenumber:'987#{i+1}5432#{i+1}2',
# dept:'ECE-#{i+1}',
# date_of_birth:'#{i+1}/9/2022'
#     )
# end
students.save