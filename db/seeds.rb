# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


kfc = Restaurant.create(name: 'KFC')
kfc.reviews.create(rating: 5, thoughts: 'Great')
kfc.reviews.create(rating: 4, thoughts: 'Good')
kfc.reviews.create(rating: 3, thoughts: 'OK')
kfc.reviews.create(rating: 2, thoughts: 'Poor')
kfc.reviews.create(rating: 1, thoughts: 'Bad')

nandos = Restaurant.create(name: 'Nandos')
nandos.reviews.create(rating: 5, thoughts: 'Really Great')
nandos.reviews.create(rating: 4, thoughts: 'Really Good')
nandos.reviews.create(rating: 3, thoughts: 'Ready OK')
nandos.reviews.create(rating: 2, thoughts: 'Ready Poor')
nandos.reviews.create(rating: 1, thoughts: 'Really Bad')


chipotle = Restaurant.create(name: 'Chipotle')
chipotle.reviews.create(rating: 5, thoughts: 'Really Great')
chipotle.reviews.create(rating: 4, thoughts: 'Really Good')
chipotle.reviews.create(rating: 3, thoughts: 'Ready OK')
chipotle.reviews.create(rating: 2, thoughts: 'Ready Poor')
chipotle.reviews.create(rating: 1, thoughts: 'Really Bad')


