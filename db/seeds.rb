# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
  email: 'admin@admin',
  password: 'testpass',
 )

# GenreModel(4)
Genre.create!(
              name: "ケーキ",
              is_enabled: true
            )

Genre.create!(
              name: "プリン",
              is_enabled: true
            )
Genre.create!(
              name: "焼き菓子",
              is_enabled: true
            )
Genre.create!(
              name: "キャンディ",
              is_enabled: true
            )
            
