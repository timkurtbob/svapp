# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Comment.destroy_all
Bookmark.destroy_all
Bee.destroy_all
Attachment.destroy_all
Entry.destroy_all
User.destroy_all
School.destroy_all

school = School.create(name: 'Bürgermeister Herz Grundschule')

user_one = User.create(
  first_name: 'Annika',
  second_name: 'Schmidt',
  birthday: Date.new(2006, 5, 22),
  form: 6,
  klass: 'a',
  role: 'SchulsprecherIn',
  email: 'annika@schmidt.de',
  phone: '+4915758942993',
  snapchat_user: '@anniannianni',
  insta_user: '@anni2006',
  tiktok_user: '@annischmidt06',
  school_id: school.id,
  password: 'xxxxxx'
  )

user_two = User.create(
  first_name: 'Tim',
  second_name: 'Kurt-Bob',
  birthday: Date.new(2010, 7, 29),
  form: 2,
  klass: 'b',
  role: 'KlassensprecherIn',
  email: 'tim-kurt-bob@aol.de',
  phone: '+4912758141004',
  snapchat_user: '@tkb',
  insta_user: '@tkb',
  tiktok_user: '@tkb2010',
  school_id: school.id,
  password: 'xxxxxx'
  )
user_three = User.create(
  first_name: 'Jeanette',
  second_name: 'Müller',
  birthday: Date.new(2009, 10, 1),
  form: 5,
  klass: 'a',
  role: 'KlassensprecherIn',
  email: 'j-mueller@gmail.de',
  phone: '+4912152341722',
  snapchat_user: '@jjm2009',
  insta_user: '@jjm2009',
  tiktok_user: '@jjm2009',
  school_id: school.id,
  password: 'xxxxxx'
  )

entry_one = Entry.create(
  title: 'Schulsprecherwahl',
  description: 'Am 12. Februar habt ihr die "Qual der Wahl". Gewählt werden die Schulsprecher und die Vertrauenslehrer.
    Zudem können die Schüler wie alle wahlberechtigten Erwachsenen die Parteien des Bundestages bei der U18-Wahl wählen.',
  date: Date.new(2019, 2, 12),
  time: Time.new(2019, 02, 12, 14, 0, 0, "+01:00"),
  location: 'Aula',
  user: user_one
  )
comment_one = Comment.create(
  text: 'Ich finde wir sollten Tim wählen. Also mich, meine ich.',
  user: user_two,
  entry: entry_one
  )
comment_two = Comment.create(
  text: 'Wo finde ich die Wahlzettel? Möchte die vorher schonmal anschauen.',
  user: user_three,
  entry: entry_one
  )
Bee.create(
  user: user_two,
  comment: comment_two
  )

entry_two = Entry.create(
  title: 'Titel2',
  description: 'Wiebke ist leider viel kreativer als ich was seed dinge angeht...',
  date: Date.new(2019, 1, 12),
  time: Time.new(2019, 01, 12, 14, 0, 0, "+01:00"),
  location: 'Irgendwo',
  user: user_one
  )
comment_three = Comment.create(
  text: 'Ich finde wir sollten Dinge tun',
  user: user_two,
  entry: entry_two
  )
comment_four = Comment.create(
  text: 'Ich will auch was kommentieren',
  user: user_three,
  entry: entry_two
  )
Bee.create(
  user: user_two,
  comment: comment_four
  )
