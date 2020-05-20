# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# seedsで初期データ流し込むための記述
5.times do |i|
  Post.create(title: "記事タイトル #{i}", content: "投稿記事 #{i}" )
end