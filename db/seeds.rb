# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Gender.create!(name: "Male", abv: "M")
Gender.create!(name: "Female", abv: "F" )
Gender.create!(name: "Non-Binary", abv: "NB")
Gender.create!(name: "Genderqueer", abv: "GQ")
Gender.create!(name: "Genderfluid", abv: "GF")
Gender.create!(name: "Transgender", abv: "TG")
Gender.create!(name: "Trans Male to Female", abv: "MtF")
Gender.create!(name: "Trans Female to Male", abv: "FtM")
Gender.create!(name: "Crossdresser/Transvestite", abv: "M")
Gender.create!(name: "Intersex", abv: "IS")
Gender.create!(name: "Femme", abv: "FEM")
Gender.create!(name: "Butch", abv: "B")
Gender.create!(name: "Not Applicable", abv: "null")
