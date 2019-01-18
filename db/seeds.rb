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
user_four = User.create(
  first_name: 'Leon',
  second_name: 'Kawiro',
  birthday: Date.new(2006, 12, 1),
  form: 2,
  klass: 'c',
  role: 'KlassensprecherIn',
  email: 'leon-kawi@gmail.de',
  phone: '+491725241002',
  snapchat_user: '@leonleon',
  insta_user: '@leonleon',
  tiktok_user: '@leonleon',
  school_id: school.id,
  password: 'xxxxxx'
  )
user_five = User.create(
  first_name: 'Yannick',
  second_name: 'Moring',
  birthday: Date.new(2010, 4, 19),
  form: 6,
  klass: 'b',
  role: 'KlassensprecherIn',
  email: 'y.moring@web.de',
  phone: '+49166209531099',
  snapchat_user: '@yanni-mori',
  insta_user: '@yanni-mori',
  tiktok_user: '@yanni-mori',
  school_id: school.id,
  password: 'xxxxxx'
  )
user_six = User.create(
  first_name: 'Chiara',
  second_name: 'Sonntag',
  birthday: Date.new(2005, 2, 16),
  form: 1,
  klass: 'b',
  role: 'KlassensprecherIn',
  email: 'chiara-sonntag@buegermeister-herz-schule.de',
  # phone: not provided,
  # snapchat_user: not provided,
  # insta_user: not provided,
  # tiktok_user: not provided,
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
  title: 'Foto-Wettbewerb der Berliner Morgenpost',
  description: 'Fast 40 Oberschulklassen aus ganz Berlin nehmen aktuell am Medienprojekt „Morgenpost@Schule“ teil: Bis Weihnachten erhalten die Teilnehmer nicht nur täglich die Zeitung im Klassensatz in der Schule und auf Wunsch E-Paper-Zugänge, sondern sind eingeladen, die multimediale Nachrichtenwelt zu entdecken. Außerdem können sie eigene Beiträge für diese Seite oder die Website der Berliner Morgenpost schreiben.

Wer gerne fotografiert, ist eingeladen, uns seine Lieblingsbilder zu mailen, ergänzt durch eine Beschreibung, was auf dem Bild zu sehen ist.

Zu gewinnen sind Sportevent-Tickets, exklusive Redaktionsführungen und aktuelle Jugendbücher.

Mitmachen ist ganz einfach: Einfach der Berliner Morgenpost auf Instagram folgen. Dann Fotos unter dem Hashtag #myberlin @morgenpost posten; am besten zusätzlich im Foto die Markierung „Morgenpost“ setzen.

Einsendeschluss ist am 15. Dezember. Wer mag, kann sein Foto plus Bildunterschrift auch ganz einfach an die Adresse jugend@morgenpost.de mailen – wir stellen es dann ebenfalls auf die Instagram-Seite.',
  date: Date.new(2019, 12, 15),
  # time: not provided
  # location: not provided,
  user: user_two
  )
comment_three = Comment.create(
  text: 'Ich mache auf jeden Fall mit. In meiner Klasse sind auch einige interessiert!',
  user: user_three,
  entry: entry_two
  )
comment_four = Comment.create(
  text: 'Lass uns doch auch mal einen schul-internen Wettbewerb machen. Die Biler die gewinnen könnten dann in den Fluren hängen. Dann sind die auch weniger grau.',
  user: user_four,
  entry: entry_two
  )
Bee.create(
  user: user_two,
  comment: comment_four
  )
Bee.create(
  user: user_one,
  comment: comment_four
  )
Bee.create(
  user: user_three,
  comment: comment_four
  )
Bee.create(
  user: user_four,
  comment: comment_four
  )

entry_three = Entry.create(
  title: 'Helfter für Infotag gesucht',
  description: 'Am Samstag, 21. März 2019 können Familien uns beim  Infotag kennenlernen. In der Aula bekommen sie in kurzen Vorträgen wichtige Informationen zum Profil der unserer Schulen. In den Klassen- und Fachräumen stellen sich die Fachbereiche und einzelne Projekte vor.
  Von unserer SV-Gruppe bräuchten wir noch ein paar Helfer, die im Raum 24G unsere SV Projekte vorstellen.',
  date: Date.new(2019, 3, 21),
  time: Time.new(2019, 3, 21, 14, 0, 0, "+01:00"),
  location: 'Raum 24G',
  user: user_three
  )
comment_five = Comment.create(
  text: 'Ich kann helfen.',
  user: user_one,
  entry: entry_three
  )
comment_six = Comment.create(
  text: 'Ich auch. Machen wir die Einteilung dafür in der nächsten SV Sitzung?',
  user: user_six,
  entry: entry_three
  )
comment_seven = Comment.create(
  text: 'Ich könnte auch. Aber die Materialien dafür erstellen wir doch noch zusammen, oder?',
  user: user_five,
  entry: entry_three
  )
Bee.create(
  user: user_two,
  comment: comment_five
  )
Bee.create(
  user: user_one,
  comment: comment_five
  )
Bee.create(
  user: user_three,
  comment: comment_six
  )
Bee.create(
  user: user_four,
  comment: comment_six
  )
