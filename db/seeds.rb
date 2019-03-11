# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts 'destroying tables...'


Bee.destroy_all
Comment.destroy_all
Bookmark.destroy_all
Attachment.destroy_all
Entry.destroy_all
User.destroy_all
School.destroy_all
Circle.destroy_all


puts 'creating mehralslernen...'

school = School.create(name: 'mehralslernen')

puts 'creating users...'

user_one = User.create(
  first_name: 'App',
  second_name: 'Infos',
  role: 0,
  email: 'nutzer@null.org',
  phone: '+030 25095844',
  school_id: school.id,
  password: '******'
  )

puts 'creating circles'

circle_one = Circle.create(
  name: 'App-Infos'
  )

circle_two = Circle.create(
  name: 'Allgemeines')

puts 'creating entries'

entry_one = Entry.create(
  title: 'Einträge',
  description: 'Neue Einträge kannst du über das Plus unten rechts hinzufügen',
  date: Date.new(2019, 3, 12),
  location: 'Aula',
  user: user_one,
  circle: circle_one
  )

entry_two = Entry.create(
  title: 'Lesezeichen',
  description: 'Lesezeichen kannst du auf jedem Eintrag oben rechts hinzufügen',
  date: Date.new(2019, 3, 15),
  user: user_one,
  circle: circle_one
  )

entry_three = Entry.create(
  title: 'Anhänge',
  description: 'Zu jedem Eintrag kannst du Dokumente und Bilder anhängen',
  date: Date.new(2019, 3, 21),
  user: user_one,
  circle: circle_one
  )

entry_four = Entry.create(
  title: 'Menü',
  description: 'Das Menü kannst du zur Navigation oben links aufrufen',
  date: Date.new(2019, 3, 21),
  user: user_one,
  circle: circle_one
  )


