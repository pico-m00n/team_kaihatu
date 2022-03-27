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

  #ItemModel
Item.create!(
              genre_id: 1,
              image_id: nil,
              name: "洋梨のチーズタルト",
              introduction: "北海道産の最高級カッテージチーズ＆最高級生クリームを贅沢に使用。",
              price: 1000,
              status: "販売可"
              )
Item.create!(
              genre_id: 1,
              image_id: nil,
              name: "いちごのショートケーキ",
              introduction: "あまおうを贅沢に使用。",
              price: 2000,
              status: "販売可"
              )
Item.create!(
              genre_id: 1,
              image_id: nil,
              name: "漢方のどあめ",
              introduction: "のどの痛みを緩和。",
              price: 300,
              status: "販売可"
              )

 # OrderModel
 Order.create!(
               shipping_name: "佐藤一",
               shipping_post_code: "222-2222",
               shipping_adress: "東京都 新宿区 新宿1丁目",
               payment_method: 1,
               shipping_cost: 800,
               total_payment: 3400,
               order_status: 1
               )


# OrderDetailModel
 OrderDetail.create!(
                       order_id: 1,
                       item_id: 1,
                       total_price: 1000,
                       amount: 1,
                       item_status: 1,
                       )
 OrderDetail.create!(
                       order_id: 1,
                       item_id: 2,
                       total_price: 2000,
                       amount: 1,
                       item_status: 1,
                       )
 OrderDetail.create!(
                       order_id: 1,
                       item_id: 3,
                       total_price: 300,
                       amount: 1,
                       item_status: 1,
                       )